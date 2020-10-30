<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class FacultyBT extends Model
{
    protected $table = "faculty_b_t_s";

    protected $fillable = ['name', 'session', 'BT_no'];

    public function faculty_session(){
        return $this->belongsTo('App\Admin\AcademicYear','session', 'id');
    }
}
