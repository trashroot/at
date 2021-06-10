<?php
namespace App\Http\Controllers\School;

use App\Http\Controllers\Controller;
use App\School;
use App\User;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $posts = [];
        $where = [];
        $user = User::where("id", Auth::id())->first();
        // var_dump($user['school_id']);
        if (isset($user['school_id'])) {
            $where[] = ["school_id", $user['school_id']];
            $posts = User::where($where)->get();
        }

        return view('school.users.posts')->with('posts', $posts);
    }
    public function create()
    {

        $schools = School::where("status", 1)->get();
        $type = ['student', 'school-admin'];

        // todo :  make sure that user can not change type value
        //sol. add validation save tym to make sure check expacted value
        return view('school.users.create')->with("schools", $schools)->with('type', $type);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8'],
        ]);

        $request->validate([
            'profile_img' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'banner_img' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $imageName = "";
        if (isset($request->profile_img)) {
            $imageName = "atp-" . time() . Str::random(8) . '.' . $request->profile_img->extension();
            $request->profile_img->move(public_path('img'), $imageName);
        }
        $bimageName = "";
        if (isset($request->banner_img)) {
            $bimageName = "atb-" . time() . Str::random(8) . '.' . $request->banner_img->extension();
            $request->banner_img->move(public_path('img'), $bimageName);
        }

        /*  $school_id = "";
        if (isset($request->school_id) && $request->school_id != '-1') {
        $school_id = $request->school_id;
        }
         */
        $user_obj = auth()->user();

        $school_id = ($user_obj->school_id);

        $contact = new User([
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'phone' => $request->get('phone'),
            'description' => $request->get('description'),
            'type' => $request->get('type'),
            'school_id' => $school_id,
            'password' => Hash::make($request->get('password')),
            'api_token' => Str::random(80),
            'profile_img' => $imageName,
            'banner_img' => $bimageName,
            'status' => 1,
        ]);

        $contact->save();

        //Mail::to($request->get('email'))->send(new Welcome($contact));

        return redirect()->route('school_users')->with('success', 'record saved!');
    }
    public function edit($id, $sid)
    {

        $post = User::where("id", $id)->where("school_id", $sid)->first();

        $schools = School::where("status", 1)->get();
        $type = ['student', 'school-admin'];
        return view('school.users.edit', compact('post'))->with("schools", $schools)->with('type', $type);
    }
    public function update(Request $request, $id, $sid)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'sometimes|required|string|email|max:255|unique:users,email,' . $id . ",id",
            'password' => ['nullable', 'string', 'min:8'],
        ]);

        $request->validate([
            'profile_img' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'banner_img' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $imageName = "";
        if (isset($request->profile_img_name)) {
            $imageName = $request->profile_img_name;
        }
        if (isset($request->profile_img)) {
            $imageName = "atp-" . time() . Str::random(8) . '.' . $request->profile_img->extension();
            $request->profile_img->move(public_path('img'), $imageName);
        }

        $bimageName = "";
        if (isset($request->banner_img_name)) {
            $bimageName = $request->banner_img_name;
        }
        if (isset($request->banner_img)) {
            $bimageName = "atb-" . time() . Str::random(8) . '.' . $request->banner_img->extension();
            $request->banner_img->move(public_path('img'), $bimageName);
        }

        /*   $school_id = "";
        if (isset($request->school_id) && $request->school_id != '-1') {
        $school_id = $request->school_id;
        } */
        $user_obj = auth()->user();

        $school_id = ($user_obj->school_id);

        //  $contact = User::where("id", $id)->first();
        $contact = User::where("id", $id)->where("school_id", $sid)->first();
        $contact->name = $request->get('name');
        $contact->email = $request->get('email');
        $contact->phone = $request->get('phone');
        $contact->description = $request->get('description');
        $contact->type = $request->get('type');
        $contact->school_id = $school_id;
        if (isset($request->password) && !empty($request->password)) {
            $contact->password = Hash::make($request->get('password'));
        }
        $contact->api_token = Str::random(80);
        $contact->profile_img = $imageName;
        $contact->banner_img = $bimageName;
        $contact->status = 1;

        if ($contact->save()) {
            return redirect()->route('school_users')->with('success', 'Record updated!');
        }
        return redirect()->route('school_users')->with('fail', 'Not Found');
    }
    public function destroy($id, $sid)
    {
        $contact = User::where("id", $id)->where("school_id", $sid)->first();

        //  $contact = User::where("id", $id)->first();
        if (!is_null($contact)) {
            $contact->delete();
            return redirect()->route('school_users')->with('success', 'Record deleted!');
        }
        return redirect()->route('school_users')->with('fail', 'Not Found');
    }

}
