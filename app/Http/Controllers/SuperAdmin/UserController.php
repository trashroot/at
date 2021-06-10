<?php
namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use App\Mail\Welcome;
use App\School;
use App\User;
use App\UserBulk;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use League\Csv\Reader;

class UserController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    { 

        $where = [];
        if (isset($request->type) && $request->type != "-1") {
            $where[] = ["type", $request->type];
        }
        if (isset($request->school) && $request->school != "-1") {
            $where[] = ["school_id", $request->school];
        }

        $posts = User::where($where)->paginate(50);
        $schools = School::where("status", 1)->get();
        $type = ['super-admin', 'content-admin', 'school-admin', 'student'];

        return view('super-admin.users.posts')->with('posts', $posts)->with("schools", $schools)->with('type', $type);
    }

    public function create()
    {
        //
        $schools = School::where("status", 1)->get();
        $type = ['student', 'super-admin', 'content-admin', 'school-admin'];
        return view('super-admin.users.create')->with("schools", $schools)->with('type', $type);
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

        $school_id = "";
        if (isset($request->school_id) && $request->school_id != '-1') {
            $school_id = $request->school_id;
        }

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

        Mail::to($request->get('email'))->send(new Welcome($contact));

        return redirect()->route('sa_users')->with('success', 'record saved!');
    }

    public function edit($id)
    {
        $post = User::find($id);
        $schools = School::where("status", 1)->get();
        $type = ['student', 'super-admin', 'content-admin', 'school-admin'];
        return view('super-admin.users.edit', compact('post'))->with("schools", $schools)->with('type', $type);
    }

    public function update(Request $request, $id)
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

        $school_id = "";
        if (isset($request->school_id) && $request->school_id != '-1') {
            $school_id = $request->school_id;
        }

        $contact = User::where("id", $id)->first();

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
            return redirect()->route('sa_users')->with('success', 'Record updated!');
        }
        return redirect()->route('sa_users')->with('fail', 'Not Found');
    }

    public function destroy($id)
    {
        //$contact = Post::find($id);
        $contact = User::where("id", $id)->first();
        if (!is_null($contact)) {
            $contact->delete();
            return redirect()->route('sa_users')->with('success', 'Record deleted!');
        }
        return redirect()->route('sa_users')->with('fail', 'Not Found');
    }

    public function bulk_create()
    {
        //
        $schools = School::where("status", 1)->get();
        $type = ['student', 'super-admin', 'content-admin', 'school-admin'];
        return view('super-admin.users.bulk_create')->with("schools", $schools)->with('type', $type);
    }

    public function bulk_confirm(Request $request)
    {
        $request->validate([
            'email' => ['required', 'string'],
        ]);

        $request->validate([
            'csv_file' => 'required|mimes:csv,txt',
        ]);

        $school_id = $request->school_id;

        $file = $request->file('csv_file');

        $records = [];
        // Create a CSV reader instance
        $reader = Reader::createFromFileObject($file->openFile());

        foreach ($reader as $index => $row) {

            // var_dump($row);
            if ($index === 0) {
                $headers = $row;
            } else {
                $data = array_combine($headers, $row);
                //Customers::create($data);
                $rec = null;
                if (isset($request->name)) {
                    if (isset($data[$request->name])) {
                        // echo "Name is". $data[$request->name];
                        $rec['name'] = $data[$request->name];
                    }
                }

                if (isset($request->email)) {
                    if (isset($data[$request->email])) {
                        //echo "email is". $data[$request->email];
                        $rec['email'] = $data[$request->email];
                    }
                }

                if (isset($request->phone)) {
                    if (isset($data[$request->phone])) {
                        //echo "phone is". $data[$request->phone];
                        $rec['phone'] = $data[$request->phone];
                    }
                }

                if (isset($request->description)) {
                    if (isset($data[$request->description])) {
                        // echo "description is". $data[$request->description];
                        $rec['description'] = $data[$request->description];
                    }
                }
                //$rec['password'] = Str::random(10);
                $rec['password'] = rand(100000, 999999);

                $records[] = $rec;

                $request->type;
                $request->school_id;

            }
        }

        return
        view('super-admin.users.confirm')->with("records", $records)->with('type', $request->type)->with('school_id', $request->school_id);
        // return redirect()->route('sa_user_bulk_confirm')->with('records', $records);
    }

    public function bulk_save(Request $request)
    {

        // var_dump( $request->toArray());
        $total_counter = 0;
        $success_counter = 0;
        $fail_counter = 0;
        $fail_message = "";

        if (is_array($request->st)) {
            $total_counter = count($request->st);
            foreach ($request->st as $student) {
                try {
                    $flight = new User;
                    $flight->name = $student['name'];
                    $flight->email = $student['email'];
                    $flight->password = Hash::make($student['password']);
                    $flight->api_token = Str::random(80);
                    $flight->phone = $student['phone'];
                    $flight->description = $student['description'];
                    $flight->type = $request->type;
                    $flight->school_id = $request->school_id;
                    $flight->status = 0;

                    //TODO:: save only if not already there
                    if ($flight->save()) {
                        $ub = new UserBulk;
                        $ub->user_id = $flight->id;
                        $ub->password = $student['password'];
                        $ub->save();
                        $success_counter++;
                    }
                } catch (\Illuminate\Database\QueryException $ex) {
                    $fail_message .= $ex->getMessage() . " | ";
                    $fail_counter++;
                    // Note any method of class PDOException can be called on $ex.
                }

            }
        }

        return redirect()->route('sa_users')->with('success', $total_counter . ' Users Sent.' . $success_counter . " added
            successfully.

            " . $fail_counter . " faild because of following reasons : (" . $fail_message . ")");

    }

    public function create_email()
    {
        return view('super-admin.users.create_mail');
    }

    public function send_user_email(Request $request)
    {
        $ret = ["success" => false, "message" => "user not found"];
        $contact = User::where("id", $request->get("id"))->first();
        if (!is_null($contact)) {

            $contact_pw = UserBulk::where("user_id", $request->get("id"))->first();
            $school = School::where("id", $contact["school_id"])->first();

            $data["name"] = $contact['name'];
            $data["domain"] = isset($school['domain']) ? $school['domain'] : "";
            $data["password"] = isset($contact_pw['password']) ? $contact_pw['password'] : "";

            Mail::to($contact['email'])->send(new Welcome($data));

            $ret['success'] = true;
            $ret['message'] = "mail sent";

        } else {
            $ret['success'] = false;
            $ret['message'] = "mail not sent";
        }
        return response()->json($ret, 200);
    }

    public function send_email(Request $request)
    {

        $contact = [];
        $contact["name"] = $request->get("name");
        $contact["password"] = "12345";

        Mail::to($request->get('email'))->send(new Welcome($contact));
        return redirect()->route('sa_user_create_email')->with('success', "mail sent");

    }

}
