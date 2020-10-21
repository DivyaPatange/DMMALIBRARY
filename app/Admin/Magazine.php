<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class Magazine extends Model
{
    protected $table = "magazines";

    protected $fillable = ['magazine_name'];
}
