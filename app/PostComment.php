<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PostComment extends Model
{
    //
    protected $table = 'post_comments';
    protected $fillable = ['user_id','post_id','description','status'];
}
