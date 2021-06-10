<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PlanLike extends Model
{
    //
    protected $table = 'plan_likes';
    protected $fillable = ['user_id','post_id'];
}
