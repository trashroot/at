<?php
namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use App\Post;
use Auth;
use Illuminate\Http\Request;

class PostController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {

        //  $posts = Post::where('user_id', Auth::id())->get();
        $posts = Post::all();
        // $posts->count();

        return view('super-admin.posts.posts')->with('posts', $posts);
    }

    public function create()
    {

        return view('super-admin.posts.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'description' => 'required',
        ]);

        $request->validate([
            'thumb_img' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $imageName = "";
        if (isset($request->thumb_img)) {
            $imageName = "atp-" . time() . '.' . $request->thumb_img->extension();
            $request->thumb_img->move(public_path('img'), $imageName);
        }

        $contact = new Post([
            'name' => $request->get('name'),
            'description' => $request->get('description'),
            'thumb_img' => $imageName,
            'video_url' => $request->get('video_url'),
            'status' => 1,
            'user_id' => Auth::id(),
        ]);

        $contact->save();
        return redirect('sa_admin/post')->with('success', 'Post saved!');
    }

    public function edit($id)
    {
        $post = Post::find($id);
        return view('super-admin.posts.edit', compact('post'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'description' => 'required',
        ]);

        $request->validate([
            'thumb_img' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $imageName = $request->get('thumb_img_value');

        if (isset($request->thumb_img)) {
            $imageName = "atp-" . time() . '.' . $request->thumb_img->extension();
            $request->thumb_img->move(public_path('img'), $imageName);
        }
        //todo : verify if admin owns the post

        // $contact = Post::find($id);
        $contact = Post::where("id", $id)->first();

        if (!is_null($contact)) {

            $contact->name = $request->get('name');
            $contact->description = $request->get('description');
            $contact->thumb_img = $imageName;
            $contact->video_url = $request->get('video_url');
            //$contact->user_id = Auth::id(); // to keep original poster ID
            $contact->save();
            return redirect('sa_admin/post')->with('success', 'Post updated!');
        } else {
            return redirect('sa_admin/post')->with('fail', 'Post Not Found!');
        }

    }

    public function destroy($id)
    {
        $contact = Post::find($id);
        //  $contact = Post::where("id", $id)->where("user_id", Auth::id())->first();
        if (!is_null($contact)) {
            $contact->delete();
            return redirect('sa_admin/post')->with('success', 'Record deleted!');
        }
        return redirect('sa_admin/post')->with('fail', 'Not Found');
    }

}
