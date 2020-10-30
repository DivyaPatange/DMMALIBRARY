<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    protected $table = "courses";

    protected $fillable = ['course_name', 'course_duration'];

    public function student_bt(){
        return $this->hasMany('App\Admin\StudentBT','class', 'id');
    }
}
