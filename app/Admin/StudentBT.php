<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class StudentBT extends Model
{
    protected $table = "student_b_t_s";
    protected $fillable = ['BT_no', 'name', 'class','department','session', 'book_bank'];

    public function course(){
        return $this->belongsTo('App\Admin\Course','class', 'id');
    }

    public function departments(){
        return $this->belongsTo('App\Admin\Department','department', 'id');
    }

    public function sessions(){
        return $this->belongsTo('App\Admin\AcademicYear','session', 'id');
    }

    public function book_transaction(){
        return $this->hasMany('App\Admin\BookTransaction','BT_no', 'id');
    }
}
