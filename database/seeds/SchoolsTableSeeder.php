<?php

use Illuminate\Database\Seeder;

class SchoolsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('schools')->insert([
            'name' => 'Wake Forest University',
            'splash_img' => 'wf-spash.jpg',
            'login_img' => 'login.jpg',
            'nav_img' => 'menu.jpg',
            'status' => 1,
        ]);

        DB::table('schools')->insert([
            'name' => 'School 2',
            'splash_img' => 'wf-spash.jpg',
            'login_img' => 'login.jpg',
            'nav_img' => 'menu.jpg',
            'status' => 1,
        ]);
    }
}
