<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class AcademicYear extends Model
{
    protected $table = "academic_years";

    protected $fillable = ['from_academic_year', 'to_academic_year'];

    public function student_bt(){
        return $this->hasMany('App\Admin\StudentBT','session', 'id');
    }

    public function faculty_bt(){
        return $this->hasMany('App\Admin\FacultyBT','session', 'id');
    }
}
