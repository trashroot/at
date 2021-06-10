<?php

namespace App\Http\Controllers;

use App\Category;
use App\Http\Resources\PlanResource as PlanResource;
use App\Http\Resources\UserResource as UserResource;
use App\Plan;
use App\PlanDay;
use App\Rules\CurrentPasswordCheckRule;
use App\User;
use App\UserPlan as UserPlan;
use App\UserPlanDay;
use Auth;
use Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Intervention\Image\Facades\Image;

class PlanController extends Controller
{
    //
    public function index(Request $req)
    {

        $data = Cache::remember('all_plan_list', (60 * 60 * 12), function () {

            $cats = Category::all()->toArray();
            foreach ($cats as &$cat) {
                $plans = Plan::where('category_id', $cat["id"])
                    ->orderBy('id', 'desc')
                    ->take(100)
                    ->get();
                $cat['plans'] = PlanResource::collection($plans);
            }
            return $cats;

        });
        // $all_plan_list = Cache::get('all_plan_list');
        $streak = $this->check_streak();

        return response()->json(["data" => $data, "streak_count" => $streak]);
    }
    //

    private function check_streak()
    {
        $user_id = Auth::id();

        $user = User::where('id', $user_id)
            ->first();
        $count = $user->streak_count;
        if ($user->last_access !== date("Y-m-d")) {
            $user->streak_count = $count + 1;
        }
        $user->last_access = date("Y-m-d");
        if ($user->save()) {
        }

        return $user->streak_count;
    }

    private function datetime_to_date($stringTime)
    {
        return date('Y-m-d', strtotime($stringTime));
    }

    public function plan_by_cat(Request $request)
    {
        $cat_id = $request->cat_id;

        $plans = Plan::where('category_id', $cat_id)
            ->orderBy('created_at', 'desc')
            ->take(100)
            ->get();

        return PlanResource::collection($plans);

        //return response()->json($cats);
    }

    public function my_plan(Request $request)
    {
        $user_id = Auth::id();

        $plan_ids = UserPlan::where('user_id', $user_id)
            ->select("plan_id")
            ->pluck('plan_id')
        //->get()
            ->toArray();

        $plans = Plan::whereIn('id', $plan_ids)
            ->get();

        return PlanResource::collection($plans);

        // return response()->json($plans);

    }

    public function add_my_plan(Request $request)
    {

        $ret = ["success" => false, "message" => "Not Valid"];

        $user_id = Auth::id();

        $flight = new UserPlan;
        $flight->user_id = $user_id;
        $flight->plan_id = $request->plan_id;

        //TODO:: save only if not already there
        if ($flight->save()) {
            $ret = ["success" => true, "message" => "Plan added to favourites", "id" => $flight->id];
        }

        return response()->json($ret, 200);
    }

    public function plan_day_answer(Request $request)
    {

        $ret = ["success" => false, "message" => "Not Valid"];

        $user_id = Auth::id();
        $plan_day = Planday::where('id', $request->plan_day_id)->first();

        if (isset($plan_day)) {

            /*  $flight = new UserPlanDay;
            $flight->plan_day_id = $request->plan_day_id;
            $flight->user_id = $user_id;
            $flight->answer = $request->answer;
            $flight->status = "complete"; */

            $flight = UserPlanDay::updateOrCreate(
                ['plan_day_id' => $request->plan_day_id, 'user_id' => $user_id],
                ['status' => "complete", "answer" => $request->answer]
            );

            $ret = ["success" => true, "message" => "Answer saved successfully", "id" =>
                $flight->id, "plan_complete" => false];
/*
if($flight->save()){
$ret = ["success"=>true,"message"=>"Answer saved successfully","id"=>
$flight->id,"plan_complete"=>false];
} */

            if (isset($request->is_plan_complete)) {

                if ($request->is_plan_complete === true || $request->is_plan_complete === "true") {
                    UserPlan::updateOrCreate(
                        ['plan_id' => $plan_day->plan_id, 'user_id' => $user_id],
                        ['status' => "complete"]
                    );
                    $ret = ["success" => true, "message" => "Answer saved successfully", "id" =>
                        $flight->id, "plan_complete" => true];
                } else {
                    UserPlan::updateOrCreate(
                        ['plan_id' => $plan_day->plan_id, 'user_id' => $user_id],
                        ['status' => "progress"]
                    );
                }

            }
        }
        return response()->json($ret, 200);
    }

    public function my_answers(Request $request)
    {

        $ret = ["success" => false, "message" => "Not Valid"];

        $user_id = Auth::id();

        $plan_answers = DB::table('plans')
            ->join('plan_days', 'plans.id', '=', 'plan_days.plan_id')
            ->join('user_plan_days', 'user_plan_days.plan_day_id', '=', 'plan_days.id')
            ->select('plans.id as plan_id', 'plans.name', 'plans.short_description',
                'plan_days.plan_id', 'plan_days.label', 'plan_days.title', 'user_plan_days.answer', 'user_plan_days.id as answer_id')
            ->where('user_plan_days.user_id', $user_id)
            ->get();

        $ret = ["success" => true, "message" => "answers", "data" => $plan_answers];

        return response()->json($ret, 200);

    }

    public function update_profile(Request $request)
    {

        $ret = ["success" => false, "message" => "Not Valid"];

        $flight = User::find(Auth::id());
        $flight->name = $request->name;
        $flight->description = $request->description;
        $flight->phone = $request->phone;

        if ($flight->save()) {
            $ret = ["success" => true, "message" => "Profile saved successfully", "data" => new UserResource($flight)];
        }

        return response()->json($ret, 200);
    }

    public function update_profile_pic(Request $request)
    {

        $ret = ["success" => false, "message" => "Not Valid"];

        $imageName = "";
        if (isset($request->profile_img)) {
            $imageName = "atp-" . time() . '.' . $request->profile_img->extension();

            //$filename = time() . '.' . $image->getClientOriginalExtension();
            $path = public_path('img/' . $imageName);
            Image::make($request->profile_img->getRealPath())->fit(300, 300, function ($constraint) {
                $constraint->aspectRatio();
                $constraint->upsize();
            })->save($path);

            $flight = User::find(Auth::id());
            $flight->profile_img = $imageName;

            if ($flight->save()) {
                $ret = ["success" => true, "message" => "Profile saved successfully", "data" => new UserResource($flight)];
            }
        }

        return response()->json($ret, 200);
    }

    public function update_banner_pic(Request $request)
    {

        $ret = ["success" => false, "message" => "Not Valid"];

        $imageName = "";
        if (isset($request->banner_img)) {
            $imageName = "atb-" . time() . '.' . $request->banner_img->extension();
            //$request->banner_img->move(public_path('img'), $imageName);

            $path = public_path('img/' . $imageName);
            Image::make($request->banner_img->getRealPath())->fit(700, 350, function ($constraint) {
                $constraint->aspectRatio();
                $constraint->upsize();
            })->save($path);

            $flight = User::find(Auth::id());
            $flight->banner_img = $imageName;

            if ($flight->save()) {
                $ret = ["success" => true, "message" => "Profile saved successfully", "data" => new UserResource($flight)];
            }
        }
    }

    public function update_password(Request $request)
    {

        $ret = ["success" => false, "message" => "Not Valid"];

        /*   $res = $request->validate([
        'current_password' => ['required', new CurrentPasswordCheckRule],
        'new_password' => ['required'],
        'new_confirm_password' => ['same:new_password'],
        ]); */

        $validator = $this->getValidationFactory()->make($request->all(), [
            'current_password' => ['required', new CurrentPasswordCheckRule],
            'new_password' => ['required'],
            'new_confirm_password' => ['same:new_password'],
        ]);

        if (!$validator->passes()) {
            return response()->json($validator->errors(), 200);
        }

        if (User::find(auth()->user()->id)->update(['password' => Hash::make($request->new_password)])) {
            $ret = ["success" => true, "message" => "Password Changed"];
        }

        return response()->json($ret, 200);
    }

}
