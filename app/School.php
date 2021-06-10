<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class School extends Model
{
    //
    protected $table = 'schools';
    protected $fillable = ['name', 'domain', 'splash_img', 'login_img', 'nav_img', 'status'];
}
