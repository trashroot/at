<?php

use Illuminate\Database\Seeder;

class PostCommentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('post_comments')->insert([
            'post_id' => 1,
            'user_id' => 4,
            'description' => "Simple comment example",
            'status' => 1,
        ]);

        DB::table('post_comments')->insert([
            'post_id' => 1,
            'user_id' => 5,
            'description' => "Simple comment example",
            'status' => 1,
        ]);

        DB::table('post_comments')->insert([
            'post_id' => 2,
            'user_id' => 4,
            'description' => "Simple comment example",
            'status' => 1,
        ]);

    }
}
