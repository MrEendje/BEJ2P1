<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\View\View;

class AllergenenController extends Controller
{
    /**
     * Scherm Overzicht Allergenen voor één product: alle allergenen die in
     * het product zitten, oplopend gesorteerd op naam.
     */
    public function show(Product $product): View
    {
        $allergenen = $product->allergenen()->orderBy('Naam')->get();

        return view('magazijn.allergenen', [
            'product' => $product,
            'allergenen' => $allergenen,
        ]);
    }
}
