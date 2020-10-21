<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class AcademicYear extends Model
{
    protected $table = "academic_years";

    protected $fillable = ['from_academic_year', 'to_academic_year'];
}
