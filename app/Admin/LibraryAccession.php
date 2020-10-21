<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class LibraryAccession extends Model
{
    protected $table = "library_accessions";

    protected $fillable =  ['BT_no', 'start_time', 'end_time'];
}
