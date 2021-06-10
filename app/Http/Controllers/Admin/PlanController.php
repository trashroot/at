<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Plan;
use App\PlanDay;
use App\Category;
use Auth;

class PlanController extends Controller
{
    //
    public function __construct() {
        $this->middleware('auth');
    }

    public function index() {
        
        $posts = Plan::where('user_id',Auth::id())->get();
        
        $cats = Category::all();
        
        return view('admin.plans.posts')->with('posts',$posts)->with('category',$cats);
    }

    public function create()
    {
        //
        $cats = Category::all();

        return view('admin.plans.create')->with('category',$cats);
    }

    public function store(Request $request)
    {
 
      //  print_r($request->all());
      //  print_r($request->days);
      //  exit;
       $request->validate([
            'name'=>'required',
            'description'=>'required'
        ]);

        $request->validate([
            'thumb_img' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        
        $imageName = "";
        if(isset($request->thumb_img)){
            $imageName = "atp-". time().'.'.$request->thumb_img->extension();
            $request->thumb_img->move(public_path('img'), $imageName);
        }

        $contact = new Plan([
            'name' => $request->get('name'),
            'description' => $request->get('description'),
            'short_description' => $request->get('short_description'),
            'category_id' => $request->get('category_id'),
            'thumb_img' => $imageName,
            'video_url' => $request->get('video_url'),
            'status' => 1,
            'user_id' =>Auth::id()
        ]);

        if($contact->save()){

               $days = $request->input('days');
               if(is_array($days) && count($days)>0){
  // var_dump($request->input('days.0.thumb_img'));
                    $cn=0;
                    foreach($days as $key => $day){
                        if(!empty($day['label'])){

                            $imageNameDay = "";
                            if(isset($request->days[$key]['thumb_img'])){
                                $imageNameDay = "atp-".$cn. time().'.'.$request->days[$key]['thumb_img']->extension();
                                $request->days[$key]['thumb_img']->move(public_path('img'), $imageNameDay);
                            }
                          

                             $pd = new PlanDay([
                                'plan_id' =>$contact->id,
                                'label' =>$day['label'],
                                'title' =>$day['title'],
                                'description' => $day['description'],
                                'thumb_img' => $imageNameDay,
                                'day' => $day['day'],
                             ]);
                             $pd->save();
                        }
                        $cn++;
                    }
               }
        }
        //exit;
        return redirect('/admin/plans')->with('success', 'Post saved!');
    }

    public function edit($id)
    {
        $post = Plan::find($id);
        $cats = Category::all();
        $days = PlanDay::where("plan_id",$id)->orderBy('day', 'asc')->get()->toArray();
        return view('admin.plans.edit', compact('post'))->with('category',$cats)->with('days',$days);
    }

   public function update(Request $request, $id)
    {
        $request->validate([
            'name'=>'required',
            'description'=>'required'
        ]);

        $request->validate([
            'thumb_img' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]); 


        $imageName = $request->get('thumb_img_value');

        if(isset($request->thumb_img)){
            $imageName = "atp-". time().'.'.$request->thumb_img->extension();
            $request->thumb_img->move(public_path('img'), $imageName);
        }
        //todo : verify if admin owns the post

        $contact = Plan::where("id",$id)->where("user_id",Auth::id())->first();

        if(!is_null($contact)){

            $contact->name = $request->get('name');
            $contact->description = $request->get('description');
            $contact->short_description = $request->get('short_description');
            $contact->category_id = $request->get('category_id');
            $contact->thumb_img =$imageName;
            $contact->video_url = $request->get('video_url');
            $contact->user_id = Auth::id();
            if($contact->save()){

                $days = $request->get('days');

                    if(is_array($days) && count($days)>0){

                        $cn=1;
                        foreach($days as $key => $day){
                        if(!empty($day['label'])){

                            $imageNameDay = "";
                            if(isset($day['thumb_img_name']) && !empty($day['thumb_img_name']) ){
                                $imageNameDay = $day['thumb_img_name'];
                            }
                            
                            if(isset($request->days[$key]['thumb_img'])){
                                    $imageNameDay = "atp-".$cn. time().'.'.$request->days[$key]['thumb_img']->extension();
                                    $request->days[$key]['thumb_img']->move(public_path('img'), $imageNameDay);
                            }

                                if(isset($day['id'])){
                                    $pd = PlanDay::find($day['id']);
                                    $pd->label = $day['label'];
                                    $pd->title = $day['title'];
                                    $pd->thumb_img = $imageNameDay;
                                    $pd->description = $day['description'];
                                    $pd->day = $day['day'];
                                }
                                else {
                                    $pd = new PlanDay([
                                        'plan_id' =>$contact->id,
                                        'label' =>$day['label'],
                                        'title' =>$day['title'],
                                        'thumb_img' => $imageNameDay,
                                        'description' => $day['description'],
                                        'day' =>$day['day'],
                                    ]);
                                }
                                $pd->save();
                                $cn++;
                        }
                        }
                    }

            }

            return redirect('/admin/plans')->with('success', 'Post updated!');
        }
        return redirect('/admin/plans')->with('fail', 'Post not found');
    }

    public function destroy($id)
    {
        $contact = Plan::where("id",$id)->where("user_id",Auth::id())->first();
      // $contact = Plan::find($id);
      if(!is_null($contact)){
            $contact->delete();
            return redirect('/admin/plans')->with('success', 'Record deleted!');
        }
        return redirect('/admin/plans')->with('fail', 'Not Found');
    }

}
