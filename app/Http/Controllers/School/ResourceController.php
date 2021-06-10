<?php
namespace App\Http\Controllers\School;

use App\Http\Controllers\Controller;
use App\Resources;
use App\User;
use Auth;
use Illuminate\Http\Request;

class ResourceController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $posts = [];
        $where = [];
        $user = User::where("id", Auth::id())->first();

        if (isset($user['school_id'])) {
            $where[] = ["school_id", $user['school_id']];
            $posts = Resources::where($where)->get();
        }

        return view('school.resources.posts')->with('posts', $posts);
    }

    public function create()
    {
        //
        return view('school.resources.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
        ]);

        $user = User::where("id", Auth::id())->first();

        if (isset($user['school_id'])) {

            $contact = new Resources([
                'name' => $request->get('name'),
                'school_id' => $user['school_id'],
                'status' => 1,
            ]);
            $contact->save();
            return redirect()->route('school_resources')->with('success', 'record saved!');

        }
        return redirect()->route('school_resources')->with('fail', 'error in details');
    }

    public function edit($id)
    {
        //var_dump(Auth::id());
        $user = User::where("id", Auth::id())->first();
        //var_dump($user->toArray());
        if (isset($user['school_id'])) {
            $post = Resources::where("id", $id)->where("school_id", $user['school_id'])->first();
            //var_dump($post->toArray());
            return view('school.resources.edit', compact('post'));
        }
        return redirect()->route('school_resources')->with('fail', 'error in details');
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
        ]);
        $user = User::where("id", Auth::id())->first();
        $school_id = "";

        if (isset($user['school_id'])) {

            $school_id = $user['school_id'];
            $contact = Resources::where("id", $id)->first();
            $contact->name = $request->get('name');
            $contact->school_id = $school_id;

            if ($contact->save()) {
                return redirect()->route('school_resources')->with('success', 'Record updated!');
            }
        }

        return redirect()->route('school_resources')->with('fail', 'Not Found');
    }

    public function destroy($id)
    {
        $user = User::where("id", Auth::id())->first();
        $school_id = "";

        if (isset($user['school_id'])) {

            $school_id = $user['school_id'];
            $contact = Resources::where("id", $id)->where("school_id", $school_id)->first();
            if (!is_null($contact)) {
                $contact->delete();
                return redirect()->route('school_resources')->with('success', 'Record deleted!');
            }
        }

        return redirect()->route('school_resources')->with('fail', 'Not Found');
    }

}
