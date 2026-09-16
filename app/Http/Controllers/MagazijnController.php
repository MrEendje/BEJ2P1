<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\View\View;

class MagazijnController extends Controller
{
    /**
     * Scherm Overzicht Magazijn Jamin: alle producten, gesorteerd op Barcode oplopend.
     */
    public function index(): View
    {
        return view('magazijn.index', [
            'producten' => Product::with('magazijn')->orderBy('Barcode')->get(),
        ]);
    }
}
