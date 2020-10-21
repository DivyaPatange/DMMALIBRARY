<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class ComputerAccession extends Model
{
    protected $table = "computer_accessions";

    protected $fillable = ['BT_no', 'system_no', 'start_time', 'end_time'];
}
