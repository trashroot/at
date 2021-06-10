<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        /*  if (Auth::guard($guard)->check()) {
        return redirect(RouteServiceProvider::HOME);
        }

        return $next($request); */

        if (Auth::guard($guard)->check()) {
            $role = Auth::user()->type;

            switch ($role) {
                case 'super-admin':
                    return redirect('/sa_admin/profile');
                    break;
                case 'content-admin':
                    return redirect('/admin/profile');
                    break;
                case 'school-admin':
                    return redirect('/sa/profile');
                    break;

                default:
                    return redirect('/home');
                    break;
            }
        }
        return $next($request);
    }
}
