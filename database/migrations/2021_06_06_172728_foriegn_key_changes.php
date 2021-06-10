<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ForiegnKeyChanges extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('categories', function (Blueprint $table) {
            $table->index('name');
        });

        Schema::table('plans', function (Blueprint $table) {
            $table->index('category_id');
            $table->index('name');
            $table->dropColumn('user_id');
        });

        Schema::table('plan_days', function (Blueprint $table) {
            $table->unsignedBigInteger('plan_id')->change();
            $table->index('plan_id');
            $table->index('title');
            $table->foreign('plan_id')->references('id')->on('plans')->onDelete('cascade');
        });

        Schema::table('posts', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id')->change();
            $table->index('user_id');
            $table->index('name');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            // $table->string('like_count',50)->change();
            // $table->string('comment_count',50)->change();
        });

        Schema::table('post_comments', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id')->change();
            $table->unsignedBigInteger('post_id')->change();
            $table->index('user_id');
            $table->index('post_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('post_id')->references('id')->on('posts')->onDelete('cascade');
        });

        Schema::table('post_likes', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id')->change();
            $table->unsignedBigInteger('post_id')->change();
            $table->index('user_id');
            $table->index('post_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('post_id')->references('id')->on('posts')->onDelete('cascade');
        });

        Schema::table('resources', function (Blueprint $table) {
            $table->index('name');
        });

        Schema::table('schools', function (Blueprint $table) {
            $table->index('name');
        });

        Schema::table('user_plans', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id')->change();
            $table->unsignedBigInteger('plan_id')->change();
            $table->index('user_id');
            $table->index('plan_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('plan_id')->references('id')->on('posts')->onDelete('cascade');
        });

        Schema::table('user_plan_days', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id')->change();
            $table->unsignedBigInteger('plan_day_id')->change();
            $table->index('user_id');
            $table->index('plan_day_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('plan_day_id')->references('id')->on('plan_days');
        });

        Schema::table('users', function (Blueprint $table) {
            $table->unsignedBigInteger('team_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
