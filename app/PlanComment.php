<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PlanComment extends Model
{
    //
    protected $table = 'plan_comments';
    protected $fillable = ['user_id','post_id','description'];
}
