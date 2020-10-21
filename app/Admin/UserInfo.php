<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class UserInfo extends Model
{
    protected $table = "users_info";

    protected $fillable = ['user_id', 'mobile', 'address'];
}
