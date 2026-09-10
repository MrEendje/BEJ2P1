<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class UserController extends Controller
{
    /**
     * Overzicht van alle gebruikers en hun rol (alleen voor beheerders).
     */
    public function index(): View
    {
        return view('admin.users.index', [
            'users' => User::with('role')->orderBy('name')->get(),
            'roles' => Role::orderBy('label')->get(),
        ]);
    }

    /**
     * Wijzig de rol van een gebruiker.
     */
    public function update(Request $request, User $user): RedirectResponse
    {
        $validated = $request->validate([
            'role_id' => ['nullable', 'exists:roles,id'],
        ]);

        $user->update(['role_id' => $validated['role_id'] ?? null]);

        return redirect()
            ->route('admin.users.index')
            ->with('status', "Rol van {$user->name} is bijgewerkt.");
    }
}
