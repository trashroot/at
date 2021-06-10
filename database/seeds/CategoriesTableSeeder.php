<?php

use Illuminate\Database\Seeder;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
          DB::table('categories')->insert([
            'name' => 'Wellness Techniques',
            'status' => 1,
        ]);

        DB::table('categories')->insert([
            'name' => 'Male Athletes',
            'status' => 1,
        ]);

        DB::table('categories')->insert([
            'name' => 'Female Athletes',
            'status' => 1
        ]);
    }
}
