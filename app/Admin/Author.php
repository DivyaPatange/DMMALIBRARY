<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class Author extends Model
{
    protected $table = "authors";

    protected $fillable = ['author_name'];
}
