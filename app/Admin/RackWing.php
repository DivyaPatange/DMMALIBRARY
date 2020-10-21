<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class RackWing extends Model
{
    protected $table = "rack_wings";

    protected $fillable = ['rack_no', 'wing'];
}
