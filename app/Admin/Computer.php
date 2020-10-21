<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class Computer extends Model
{
    protected $table = "computers";
    protected $fillable = ['system_no'];
}
