<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Resources extends Model
{
    //
    protected $table = 'resources';
    protected $fillable = ['name','school_id','status'];
}
