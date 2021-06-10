<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserPlanDay extends Model
{
    //
    protected $table = 'user_plan_days';
    protected $fillable = ['plan_day_id','user_id','status','answer'];
}
