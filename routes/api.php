<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */

Route::post('login', 'AuthController@login');
Route::post('register', 'AuthController@register');
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => 'auth:api'], function () {
    Route::get('user-detail', 'AuthController@userDetail');

    Route::get('posts', 'PostController@index');
    // Route::post('posts', 'PostController@index');
    Route::post('post_comment', 'PostController@post_comment');
    Route::post('post_like', 'PostController@post_like');
    Route::post('my_comments', 'PostController@my_comments');
    Route::post('resources', 'PostController@resources');

    //Route::post('posts', 'PostController@store');
    //Route::put('posts/{id}', 'PostController@update');
    //Route::delete('posts/{id}', 'PostController@delete');

    Route::post('plans', 'PlanController@index');
    Route::post('plan_by_cat', 'PlanController@plan_by_cat');
    Route::post('my_plan', 'PlanController@my_plan');
    Route::post('add_my_plan', 'PlanController@add_my_plan');
    Route::post('plan_day_answer', 'PlanController@plan_day_answer');
    Route::post('update_profile', 'PlanController@update_profile');
    Route::post('update_password', 'PlanController@update_password');
    Route::post('update_profile_pic', 'PlanController@update_profile_pic');
    Route::post('update_banner_pic', 'PlanController@update_banner_pic');
    Route::post('my_answers', 'PlanController@my_answers');

});
