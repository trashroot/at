<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddNewFieldsToUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            //
            $table->string('profile_img', 255)->nullable();
            $table->string('banner_img', 255)->nullable();
            $table->string('phone', 55)->nullable();
            $table->string('description', 255)->nullable();
            $table->string('type', 55)->default("student"); // super-admin,content-admin,school-admin,student
            $table->integer('school_id')->nullable();
            $table->integer('streak_count')->nullable();
            $table->tinyInteger('status')->default(1);
            $table->string('api_token', 80)->after('password')
                ->unique()
                ->nullable()
                ->default(null);
            $table->timestamp('last_access');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            //
        });
    }
}
