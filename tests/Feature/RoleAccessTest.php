<?php

namespace Tests\Feature;

use App\Models\Role;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class RoleAccessTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();

        $this->seed(\Database\Seeders\RoleSeeder::class);
    }

    private function userWithRole(string $role): User
    {
        return User::factory()->create([
            'role_id' => Role::where('name', $role)->value('id'),
        ]);
    }

    public function test_guest_is_redirected_from_admin_area(): void
    {
        $this->get('/admin/users')->assertRedirect('/login');
    }

    public function test_regular_user_gets_403_on_admin_area(): void
    {
        $this->actingAs($this->userWithRole('user'))
            ->get('/admin/users')
            ->assertForbidden();
    }

    public function test_admin_can_open_user_management(): void
    {
        $this->actingAs($this->userWithRole('admin'))
            ->get('/admin/users')
            ->assertOk()
            ->assertSee('Gebruikersbeheer');
    }

    public function test_admin_can_change_a_users_role(): void
    {
        $admin = $this->userWithRole('admin');
        $target = $this->userWithRole('user');
        $adminRoleId = Role::where('name', 'admin')->value('id');

        $this->actingAs($admin)
            ->patch("/admin/users/{$target->id}", ['role_id' => $adminRoleId])
            ->assertRedirect('/admin/users');

        $this->assertSame($adminRoleId, $target->fresh()->role_id);
    }

    public function test_new_registration_gets_the_default_user_role(): void
    {
        $this->post('/register', [
            'name' => 'Nieuwe Gebruiker',
            'email' => 'nieuw@example.com',
            'password' => 'password',
            'password_confirmation' => 'password',
        ]);

        $this->assertTrue(
            User::where('email', 'nieuw@example.com')->first()->hasRole('user')
        );
    }
}
