<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class DepartmentLibrary extends Model
{
    protected $table = "department_libraries";

    protected $fillable = ['department_id', 'book_no', 'allocation_date'];
}
