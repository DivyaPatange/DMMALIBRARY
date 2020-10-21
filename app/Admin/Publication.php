<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class Publication extends Model
{
    protected $table = "publications";

    protected $fillable = ['publication_name'];
}
