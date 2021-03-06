<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Hash;
use App\User;
use Auth;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\UserResource ;

class AuthController extends Controller
{
    public function login(Request $request)
    {

        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
             $user = $request->user();
             $data['token'] = $user->createToken('MyApp')->accessToken;
            // $data['name']  = $user->name;
            $data['user'] = new UserResource($user);
            return response()->json($data, 200);
         }

       return response()->json(['error'=>'Unauthorized'], 401);
    }

    public function register(Request $request)
    {
/* 
      $validator = Validator::make($request->all(), [
        'name' => 'required',
        'email' => 'required|email|unique:users',
        'password' => 'required|min:8|confirmed',
      ]);

      if ($validator->fails()) {
          return response()->json(['error'=>$validator->errors()], 401);
      }

      $user = $request->all();
      $user['password'] = Hash::make($user['password']);
      $user = User::create($user);
      $success['token'] =  $user->createToken('MyApp')-> accessToken; 
      $success['name'] =  $user->name;

      return response()->json(['success'=>$success], $this-> successStatus);  */
    }

    public function userDetail()
    {
        //$user = Auth::user();
        $user_data = new UserResource(User::find(Auth::id()));
        return response()->json(["user"=>$user_data], 200);
    }

}
