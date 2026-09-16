<?php

namespace Database\Seeders;

use App\Models\Role;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Eerst de rollen (stamtabel).
        $this->call(RoleSeeder::class);

        $adminRole = Role::where('name', 'admin')->first();
        $userRole = Role::where('name', 'user')->first();
        $magazijnRole = Role::where('name', 'magazijn_medewerker')->first();

        // Een beheerder om mee in te loggen tijdens de demo.
        User::factory()->create([
            'name' => 'Beheerder',
            'email' => 'admin@example.com',
            'role_id' => $adminRole?->id,
        ]);

        // Een gewone gebruiker.
        User::factory()->create([
            'name' => 'Test User',
            'email' => 'test@example.com',
            'role_id' => $userRole?->id,
        ]);

        // Een magazijnmedewerker om mee in te loggen bij Overzicht Magazijn Jamin.
        User::factory()->create([
            'name' => 'Magazijnmedewerker',
            'email' => 'magazijn@example.com',
            'role_id' => $magazijnRole?->id,
        ]);
    }
}
