<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PlanDay extends Model
{
    //
    protected $table = 'plan_days';
    protected $fillable = ['plan_id','label','title','description','day','thumb_img'];
}
