<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\View\View;

class LeveringController extends Controller
{
    /**
     * Scherm Levering Informatie voor één product: alle leveringen aan het
     * magazijn, oplopend gesorteerd op datum, met de leveranciergegevens.
     * Is er geen voorraad, dan tonen we alleen de verwachte eerstvolgende
     * levering en verwijzen we na 4 seconden terug naar het overzicht.
     */
    public function show(Product $product): View
    {
        $product->load(['magazijn', 'leveringen' => function ($query) {
            $query->with('leverancier')->orderBy('DatumLevering');
        }]);

        $aantalAanwezig = $product->magazijn?->AantalAanwezig;
        $heeftVoorraad = $aantalAanwezig !== null && $aantalAanwezig > 0;

        $eerstvolgendeLevering = $heeftVoorraad ? null : $product->leveringen
            ->pluck('DatumEerstVolgendeLevering')
            ->filter()
            ->max();

        return view('magazijn.levering', [
            'product' => $product,
            'heeftVoorraad' => $heeftVoorraad,
            'eerstvolgendeLevering' => $eerstvolgendeLevering,
            'leverancier' => $product->leveringen->first()?->leverancier,
        ]);
    }
}
