<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserBulk extends Model
{
    protected $table = 'user_bulk';
    protected $fillable = ['user_id','password','email_date','email_sent'];
}
