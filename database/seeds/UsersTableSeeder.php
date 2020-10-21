<?php

use Illuminate\Database\Seeder;
use App\User;
use App\Role;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::truncate();
        DB::table('role_user')->truncate();

        $adminRole = Role::where('acc_type', 'admin')->first();
        $userRole = Role::where('acc_type', 'user')->first();

        $admin = User::create([
            'name' => 'Admin',
            'email' => 'admin@admin.com',
            'acc_type' => 'admin',
            'password' => Hash::make('admin@admin.com'),
            'password_1' => 'admin@admin.com'
        ]);

        $user = User::create([
            'name' => 'User',
            'email' => 'user@user.com',
            'acc_type' => 'user',
            'password' => Hash::make('user@user.com'),
            'password_1' => 'user@user.com',
        ]);

        $admin->roles()->attach($adminRole);
        $user->roles()->attach($userRole);
    }
}
