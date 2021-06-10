<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    //
    protected $table = 'posts';
    protected $fillable = ['user_id','name','thumb_img','video_url','description','like_count','comment_count','status'];
}
