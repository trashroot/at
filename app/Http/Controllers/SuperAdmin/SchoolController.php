<?php
namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use App\School;
use Illuminate\Http\Request;

class SchoolController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {

        $posts = School::where('status', 1)->get();

        return view('super-admin.schools.posts')->with('posts', $posts);
    }

    public function create()
    {
        //
        return view('super-admin.schools.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'domain' => 'required',
        ]);

        $contact = new School([
            'name' => $request->get('name'),
            'domain' => $request->get('domain'),
            'status' => 1,
        ]);

        $contact->save();
        return redirect()->route('sa_schools')->with('success', 'Record saved!');
    }

    public function edit($id)
    {
        $post = School::find($id);
        return view('super-admin.schools.edit', compact('post'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'domain' => 'required',
        ]);

        $contact = School::where("id", $id)->first();

        if (!is_null($contact)) {

            $contact->name = $request->get('name');
            $contact->domain = $request->get('domain');
            $contact->save();
            return redirect()->route('sa_schools')->with('success', 'Record updated!');
        } else {
            return redirect()->route('sa_schools')->with('fail', 'Record Not Found!');
        }
    }

    public function destroy($id)
    {
        //$contact = Post::find($id);
        $contact = School::where("id", $id)->first();
        if (!is_null($contact)) {
            //$contact->delete();
            $contact->status = 0;
            $contact->save();
            return redirect()->route('sa_schools')->with('success', 'Record is inactive now');
        }
        return redirect()->route('sa_schools')->with('fail', 'Not Found');
    }
}
