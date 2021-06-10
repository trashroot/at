<?php
namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use App\Resources;
use App\School;
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

        $where = [];

        if (isset($request->school) && $request->school != "-1") {
            $where[] = ["school_id", $request->school];
        }

        $posts = Resources::where($where)->get();
        $schools = School::where("status", 1)->get();

        return view('super-admin.resources.posts')->with('posts', $posts)->with("schools", $schools);
    }

    public function create()
    {
        //
        $schools = School::where("status", 1)->get();
        return view('super-admin.resources.create')->with("schools", $schools);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'school_id' => 'required',
        ]);

        $contact = new Resources([
            'name' => $request->get('name'),
            'school_id' => $request->get('school_id'),
            'status' => 1,
        ]);

        $contact->save();
        return redirect()->route('sa_resources')->with('success', 'record saved!');
    }

    public function edit($id)
    {
        $post = Resources::find($id); //fetch a record of a single line from table
        $schools = School::where("status", 1)->get();
        return view('super-admin.resources.edit', compact('post'))->with("schools", $schools);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'school_id' => 'required',
        ]);

        $school_id = "";
        if (isset($request->school_id) && $request->school_id != '-1') {
            $school_id = $request->school_id;
        }

        $contact = Resources::where("id", $id)->first();
        $contact->name = $request->get('name');
        $contact->school_id = $school_id;

        if ($contact->save()) {
            return redirect()->route('sa_resources')->with('success', 'Record updated!');
        }
        return redirect()->route('sa_resources')->with('fail', 'Not Found');
    }

    public function destroy($id)
    {
        //$contact = Post::find($id);
        $contact = Resources::where("id", $id)->first();
        if (!is_null($contact)) {
            $contact->delete();
            return redirect()->route('sa_resources')->with('success', 'Record deleted!');
        }
        return redirect()->route('sa_resources')->with('fail', 'Not Found');
    }

}
