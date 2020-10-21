<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentBookIssueDatesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('student_book_issue_dates', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('student_book_issue_id');
            $table->foreign('student_book_issue_id')->references('id')->on('student_book_issues');
            $table->date('issue_date');
            $table->date('expected_return_date');
            $table->string('penalty_days')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('student_book_issue_dates');
    }
}
