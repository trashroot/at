<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Category;
use Auth;

class CategoryController extends Controller
{
    //
    public function __construct() {
        $this->middleware('auth');
    }

    public function index() {
        
       $posts = Category::all();

        return view('admin.category.posts')->with('posts',$posts);
    }

    public function create()
    {
        //
        return view('admin.category.create');
    }

    public function store(Request $request)
    {
       $request->validate([
            'name'=>'required'
        ]);

      
        $contact = new Category([
            'name' => $request->get('name'),
            'status' => 1,
        ]);

        $contact->save();
        return redirect('/admin/category')->with('success', 'Record saved!');
    }

    public function edit($id)
    {
        $post = Category::find($id);
        return view('admin.category.edit', compact('post'));
    }

   public function update(Request $request, $id)
    {
        $request->validate([
            'name'=>'required'
        ]);

      
        $imageName = $request->get('thumb_img_value');


        $contact = Category::find($id);
        $contact->name = $request->get('name');
        $contact->status = 1;
        $contact->save();

        return redirect('/admin/category')->with('success', 'Post updated!');

    }

    public function destroy($id)
    {
       $contact = Category::find($id);
       $contact->delete();
       return redirect('/admin/category')->with('success', 'Record deleted!');
    }

}
