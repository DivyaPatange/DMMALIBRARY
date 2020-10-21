<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class Video extends Model
{
    protected $table = "videos";

    protected $fillable = ['title', 'video'];
}
