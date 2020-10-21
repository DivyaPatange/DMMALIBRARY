<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class StudentBT extends Model
{
    protected $table = "student_b_t_s";
    protected $fillable = ['BT_no', 'name', 'class','department','session', 'book_bank'];
}
