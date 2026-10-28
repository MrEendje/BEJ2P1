<?php

use App\Http\Controllers\Admin\UserController as AdminUserController;
use App\Http\Controllers\AllergenenController;
use App\Http\Controllers\LeverancierController;
use App\Http\Controllers\LeveringController;
use App\Http\Controllers\MagazijnController;
use App\Http\Controllers\NieuweLeveringController;
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
        Route::get('/{product}/levering', [LeveringController::class, 'show'])->name('levering');
        Route::get('/{product}/allergenen', [AllergenenController::class, 'show'])->name('allergenen');
    });

// Overzicht leveranciers: bereikbaar voor beheerders en magazijnmedewerkers.
Route::middleware(['auth', 'role:admin,magazijn_medewerker'])
    ->prefix('leveranciers')
    ->name('leveranciers.')
    ->whereNumber(['leverancier', 'product'])
    ->group(function () {
        Route::get('/', [LeverancierController::class, 'index'])->name('index');
        Route::get('/{leverancier}/producten', [LeverancierController::class, 'producten'])->name('producten');
        Route::get('/{leverancier}/producten/{product}/levering', [NieuweLeveringController::class, 'create'])->name('levering.create');
        Route::post('/{leverancier}/producten/{product}/levering', [NieuweLeveringController::class, 'store'])->name('levering.store');
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
