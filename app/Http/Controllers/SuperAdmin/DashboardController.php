<?php
//https://medium.com/fabcoding/laravel-redirect-users-according-to-roles-and-protect-routes-bde324fe1823
namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    //
     public function __construct() {
        $this->middleware('auth');
    }
    public function index() {
        return view('super-admin.dashboard');
    }
}
