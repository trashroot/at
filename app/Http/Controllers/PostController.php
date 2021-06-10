<?php

namespace App\Http\Controllers;

use App\Http\Resources\CommentResource;
use App\Http\Resources\PostResource as PostResource;
use App\Http\Resources\PostCollection as PostCollection;
use App\Post;
use App\PostComment;
use App\PostLike;
use App\Resources;
use App\User;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class PostController extends Controller
{
    //
    public function index(Request $request)
    {

        $school_id = $request->school_id;

        $data = Cache::remember('all_post_list_sc_' . $school_id, (60 * 60 * 1), function () use ($school_id) {

            $users = $this::get_content_users($school_id);

            $posts = Post::whereIn('user_id', $users)
                ->orderBy('id', 'desc')
                // ->take(1)
                // ->get();
                ->paginate(1);

            // return PostResource::collection($posts);
            return new PostCollection($posts);
            // return new PostCollection(Post::paginate());
        });
        $streak = $this->check_streak();
        return $data->additional(['meta' => [
            'streak_count' => $streak,
        ]]);
        // var_dump($data->toArray());
        $streak = $this->check_streak();

        $ret = array("data" => $data, "streak_count" => $streak);

        return $ret;

    }

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

    public function resources(Request $request)
    {

        $school_id = $request->school_id;

        $data = Cache::remember('resourse_school_' . $school_id, (60 * 60 * 24), function () use ($school_id) {
            $posts = Resources::where('school_id', $school_id)
                ->orderBy('id', 'desc')
                ->get();
            return $posts;

        });
        $ret = ["success" => true, "message" => "resources", "data" => $data];

        return response()->json($ret, 200);

    }

    private function get_content_users($school_id)
    {
        return User::where('type', 'content-admin')
            ->orWhere(function ($q) use ($school_id) {
                $q->where('type', 'school-admin')
                    ->where('school_id', $school_id);
            })
            ->orderBy('created_at', 'desc')
            ->take(10)
            ->select('id')
            ->pluck('id')
        //->get()
            ->toArray();

    }

    public function post_like(Request $request)
    {

        $ret = ["success" => false, "message" => "Not Valid"];

        $user_id = Auth::id();

        $flight = PostLike::updateOrCreate(
            ['post_id' => $request->post_id, 'user_id' => $user_id],
            ['post_id' => $request->post_id, "user_id" => $user_id]
        );

        if ($flight->save()) {
            $ret = ["success" => true, "message" => "Post like saved!", "id" => $flight->id];
        }

        return response()->json($ret, 200);
    }

    public function post_comment(Request $request)
    {

        $ret = ["success" => false, "message" => "Not Valid"];

        $user_id = Auth::id();

        $flight = new PostComment;
        $flight->user_id = $user_id;
        $flight->post_id = $request->post_id;
        $flight->description = $request->description;
        $flight->status = "0";

        $comment = new CommentResource($flight);

        if ($flight->save()) {
            $ret = ["success" => true, "message" => "Comment is saved in our system. It will be visible after administrator approval!", "data" => $comment];
        }

        return response()->json($ret, 200);
    }
    public function my_comments(Request $request)
    {

        $ret = ["success" => false, "message" => "Not Valid"];

        $user_id = Auth::id();

        $comments = PostComment::where('user_id', $user_id)->where("post_id", $request->post_id)
        //->select("id","post_id","description")
            ->get();

        $comments_list = CommentResource::collection($comments);
        $ret = ["success" => true, "message" => "comments", "data" => $comments_list, "post_id" => $request->post_id];

        return response()->json($ret, 200);

    }

}
