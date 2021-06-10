<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('admin_dashboard', 'Admin\DashboardController@index')->middleware('role:content-admin');
Route::get('/sa_dashboard', 'SuperAdmin\DashboardController@index')->middleware('role:super-admin');
Route::get('/school_dashboard', 'School\DashboardController@index')->middleware('role:school-admin');

Route::get('/home', 'HomeController@index')->name('home');

Route::group(['middleware' => 'auth'], function () {
    Route::resource('user', 'UserController', ['except' => ['show']]);
    Route::get('profile', ['as' => 'profile.edit', 'uses' => 'ProfileController@edit']);
    Route::put('profile', ['as' => 'profile.update', 'uses' => 'ProfileController@update']);
    Route::put('profile/password', ['as' => 'profile.password', 'uses' => 'ProfileController@password']);
});

Route::group(['middleware' => 'role:super-admin'], function () {

    Route::get('sa_admin/dashboard', 'SuperAdmin\DashboardController@index')->name('sa_dashboard');
    Route::get('sa_admin/profile', 'SuperAdmin\ProfileController@edit')->name('sa_profile_edit');
    Route::put('sa_admin/profile', 'SuperAdmin\ProfileController@update')->name('sa_profile_save');
    Route::put('sa_admin/profile/password', 'SuperAdmin\ProfileController@password')->name('sa_password');

    Route::get('sa_admin/schools', 'SuperAdmin\SchoolController@index')->name('sa_schools');
    Route::get('sa_admin/schools/create', 'SuperAdmin\SchoolController@create')->name('sa_school_create');
    Route::post('sa_admin/schools', 'SuperAdmin\SchoolController@store')->name('sa_school_create_save');
    Route::get('sa_admin/schools/{post}/edit', 'SuperAdmin\SchoolController@edit')->name('sa_school_edit');
    Route::put('sa_admin/schools/{post}', 'SuperAdmin\SchoolController@update')->name('sa_school_edit_save');
    Route::delete('sa_admin/schools/{post}', 'SuperAdmin\SchoolController@destroy')->name('sa_school_delete');

    Route::get('sa_admin/users', 'SuperAdmin\UserController@index')->name('sa_users');
    Route::get('sa_admin/users/create', 'SuperAdmin\UserController@create')->name('sa_user_create');
    Route::post('sa_admin/users', 'SuperAdmin\UserController@store')->name('sa_user_create_save');
    Route::get('sa_admin/users/{post}/edit', 'SuperAdmin\UserController@edit')->name('sa_user_edit');
    Route::put('sa_admin/users/{post}', 'SuperAdmin\UserController@update')->name('sa_user_edit_save');
    Route::delete('sa_admin/users/{post}', 'SuperAdmin\UserController@destroy')->name('sa_user_delete');

    Route::get('sa_admin/users/create_email', 'SuperAdmin\UserController@create_email')->name('sa_user_create_email');
    Route::post('sa_admin/users/send_email', 'SuperAdmin\UserController@send_email')->name('sa_user_send_email');
    Route::post('sa_admin/users/send_user_email', 'SuperAdmin\UserController@send_user_email')->name('sa_user_send_email_wc');

    Route::get('sa_admin/users/bulk_create', 'SuperAdmin\UserController@bulk_create')->name('sa_user_bulk_create');
    Route::post('sa_admin/users/bulk_save', 'SuperAdmin\UserController@bulk_save')->name('sa_user_bulk_create_save');
    Route::post('sa_admin/users/bulk_confirm', 'SuperAdmin\UserController@bulk_confirm')->name('sa_user_bulk_confirm');

    Route::get('sa_admin/resources', 'SuperAdmin\ResourceController@index')->name('sa_resources');
    Route::get('sa_admin/resources/create', 'SuperAdmin\ResourceController@create')->name('sa_resources_create');
    Route::post('sa_admin/resources', 'SuperAdmin\ResourceController@store')->name('sa_resources_create_save');
    Route::get('sa_admin/resources/{post}/edit', 'SuperAdmin\ResourceController@edit')->name('sa_resource_edit');
    Route::put('sa_admin/resources/{post}', 'SuperAdmin\ResourceController@update')->name('sa_resource_edit_save');
    Route::delete('sa_admin/resources/{post}', 'SuperAdmin\ResourceController@destroy')->name('sa_resource_delete');

    Route::get('sa_admin/post', 'SuperAdmin\PostController@index')->name('sa_posts');
    Route::get('sa_admin/post/create', 'SuperAdmin\PostController@create')->name('sa_posts_create');
    Route::post('sa_admin/posts', 'SuperAdmin\PostController@store')->name('sa_posts_create_store');;
    Route::get('sa_admin/posts/{post}/edit', 'SuperAdmin\PostController@edit')->name('sa_post_edit');
    Route::put('sa_admin/posts/{post}', 'SuperAdmin\PostController@update')->name('sa_post_edit_save');
    Route::delete('sa_admin/posts/{post}', 'SuperAdmin\PostController@destroy')->name('sa_post_delete');

});

Route::group(['middleware' => 'role:content-admin'], function () {

    Route::get('admin/dashboard', 'Admin\DashboardController@index')->name('admin_dashboard');
    Route::get('admin/profile', 'Admin\ProfileController@edit')->name('admin_profile_edit');
    Route::put('admin/profile', 'Admin\ProfileController@update')->name('admin_profile_save');
    Route::put('admin/profile/password', 'Admin\ProfileController@password')->name('admin_password');

    Route::get('admin/posts', 'Admin\PostController@index')->name('admin.posts');
    Route::get('admin/post/create', 'Admin\PostController@create');
    Route::post('admin/posts', 'Admin\PostController@store');
    Route::get('admin/posts/{post}/edit', 'Admin\PostController@edit')->name('admin_post_edit');
    Route::put('admin/posts/{post}', 'Admin\PostController@update')->name('admin_post_edit_save');
    Route::delete('admin/posts/{post}', 'Admin\PostController@destroy')->name('admin_post_delete');

    Route::get('admin/plans', 'Admin\PlanController@index')->name('admin.plans');
    Route::get('admin/plans/create', 'Admin\PlanController@create');
    Route::post('admin/plans', 'Admin\PlanController@store');
    Route::get('admin/plans/{post}/edit', 'Admin\PlanController@edit')->name('admin_plan_edit');
    Route::put('admin/plans/{post}', 'Admin\PlanController@update')->name('admin_plan_edit_save');
    Route::delete('admin/plans/{post}', 'Admin\PlanController@destroy')->name('admin_plan_delete');

    Route::get('admin/category', 'Admin\CategoryController@index')->name('admin.category');
    Route::get('admin/category/create', 'Admin\CategoryController@create');
    Route::post('admin/category', 'Admin\CategoryController@store');
    Route::get('admin/category/{post}/edit', 'Admin\CategoryController@edit')->name('admin_cat_edit');
    Route::put('admin/category/{post}', 'Admin\CategoryController@update')->name('admin_cat_edit_save');
    Route::delete('admin/category/{post}', 'Admin\CategoryController@destroy')->name('admin_cat_delete');

});

Route::group(['middleware' => 'role:school-admin'], function () {

    Route::get('sa/dashboard', 'School\DashboardController@index')->name('school_dashboard');
    Route::get('sa/profile', 'School\ProfileController@edit')->name('school_profile_edit');
    Route::put('sa/profile', 'School\ProfileController@update')->name('school_profile_save');
    Route::put('sa/profile/password', 'School\ProfileController@password')->name('school_password');

    Route::get('sa/posts', 'School\PostController@index')->name('school.posts');
    Route::get('sa/post/create', 'School\PostController@create');
    Route::post('sa/posts', 'School\PostController@store');
    Route::get('sa/posts/{post}/edit', 'School\PostController@edit')->name('school_post_edit');
    Route::put('sa/posts/{post}', 'School\PostController@update')->name('school_post_edit_save');
    Route::delete('sa/posts/{post}', 'School\PostController@destroy')->name('school_post_delete');

    Route::get('sa/resources', 'School\ResourceController@index')->name('school_resources');
    Route::get('sa/resources/create', 'School\ResourceController@create')->name('school_resources_create');
    Route::post('sa/resources', 'School\ResourceController@store')->name('school_resources_create_save');
    Route::get('sa/resources/{post}/edit', 'School\ResourceController@edit')->name('school_resource_edit');
    Route::put('sa/resources/{post}', 'School\ResourceController@update')->name('school_resource_edit_save');
    Route::delete('sa/resources/{post}', 'School\ResourceController@destroy')->name('school_resource_delete');

    Route::get('sa/users', 'School\UserController@index')->name('school_users');
    Route::get('sa/users/create', 'School\UserController@create')->name('school_users_create');
    Route::post('sa/users', 'School\UserController@store')->name('school_users_create_save');
    Route::get('sa/users/edit/{id}/{sid}','School\UserController@edit')->name('sa_users_edit');
    Route::put('sa/users/{id}/{sid}', 'School\UserController@update')->name('school_users_edit_save');
    Route::delete('sa/users/{id}/{sid}', 'School\UserController@destroy')->name('school_user_delete');
});
