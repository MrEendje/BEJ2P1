<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\View\View;

class LeveringController extends Controller
{
    /**
     * Scherm Levering Informatie voor één product: alle leveringen aan het
     * magazijn, oplopend gesorteerd op datum, met de leveranciergegevens.
     */
    public function show(Product $product): View
    {
        $product->load(['leveringen' => function ($query) {
            $query->with('leverancier')->orderBy('DatumLevering');
        }]);

        return view('magazijn.levering', [
            'product' => $product,
            'leverancier' => $product->leveringen->first()?->leverancier,
        ]);
    }
}
