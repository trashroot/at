<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Plan extends Model
{
    //
    protected $table = 'plans';
    protected $fillable = ['category_id','name','user_id','thumb_img','video_url','description','short_description','day_count'];
}
