<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLibraryJournalTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('library_journal', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('registration_no');
            $table->string('author_name');
            $table->string('name');
            $table->string('price');
            $table->string('pages');
            $table->string('publisher');
            $table->string('seller');
            $table->string('date');
            $table->string('bill_no');
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
        Schema::dropIfExists('library_journal');
    }
}
