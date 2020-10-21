<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class Journal extends Model
{
    protected $table =  "journals";

    protected $fillable = ['journal_type','journal_title', 'file'];
}
