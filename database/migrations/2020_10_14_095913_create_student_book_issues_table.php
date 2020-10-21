<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentBookIssuesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('student_book_issues', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('bookTransaction_id');
            $table->foreign('bookTransaction_id')->references('id')->on('book_transactions');
            $table->string('book_no');
            $table->date('actual_return_date')->nullable();
            $table->string('book_status')->nullable();
            $table->boolean('status')->default(0);
            $table->string('penalty')->nullable();
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
        Schema::dropIfExists('student_book_issues');
    }
}
