<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserPlan extends Model
{
    //
    protected $table = 'user_plans';
    protected $fillable = ['plan_id','user_id','status'];
}
