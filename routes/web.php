<?php

use App\Http\Controllers\Admin\UserController as AdminUserController;
use App\Http\Controllers\MagazijnController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// Overzicht Magazijn Jamin: bereikbaar voor beheerders en magazijnmedewerkers.
Route::middleware(['auth', 'role:admin,magazijn_medewerker'])
    ->prefix('magazijn')
    ->name('magazijn.')
    ->group(function () {
        Route::get('/', [MagazijnController::class, 'index'])->name('index');
    });

// Beheerdersgedeelte: alleen bereikbaar met de rol 'admin'.
Route::middleware(['auth', 'role:admin'])
    ->prefix('admin')
    ->name('admin.')
    ->group(function () {
        Route::get('/users', [AdminUserController::class, 'index'])->name('users.index');
        Route::patch('/users/{user}', [AdminUserController::class, 'update'])->name('users.update');
    });

require __DIR__.'/auth.php';
