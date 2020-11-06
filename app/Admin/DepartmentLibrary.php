<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class DepartmentLibrary extends Model
{
    protected $table = "department_libraries";

    protected $fillable = ['department_id', 'category', 'book_no', 'allocation_date'];
}
