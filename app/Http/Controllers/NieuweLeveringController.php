<?php

namespace App\Http\Controllers;

use App\Models\LeveringModel;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class NieuweLeveringController extends Controller
{
    public function __construct(private LeveringModel $leveringModel)
    {
    }

    /**
     * Scherm Levering product (Wireframe-04): formulier voor een nieuwe
     * zending van een product door een leverancier.
     */
    public function create(int $leverancier, int $product): View
    {
        return view('leverancier.levering', [
            'levering' => $this->findLeveringProduct($leverancier, $product),
        ]);
    }

    /**
     * Slaat de nieuwe zending op en gaat terug naar Geleverde producten.
     * Wordt het product niet meer geproduceerd, dan tonen we een melding
     * op het scherm Levering product.
     */
    public function store(Request $request, int $leverancier, int $product): RedirectResponse
    {
        $levering = $this->findLeveringProduct($leverancier, $product);

        $gegevens = $request->validate([
            'aantal' => ['required', 'integer', 'min:1', 'max:100000'],
            'datum_eerstvolgende_levering' => ['required', 'date'],
        ], [
            'required' => 'Het veld :attribute is verplicht.',
            'integer' => 'Het veld :attribute moet een geheel getal zijn.',
            'min' => 'Het veld :attribute moet minimaal :min zijn.',
            'max' => 'Het veld :attribute mag maximaal :max zijn.',
            'date' => 'Het veld :attribute moet een geldige datum zijn.',
        ], [
            'aantal' => 'Aantal producteenheden',
            'datum_eerstvolgende_levering' => 'Datum eerstvolgende levering',
        ]);

        $isGelukt = $this->leveringModel->create(
            $leverancier,
            $product,
            (int) $gegevens['aantal'],
            $gegevens['datum_eerstvolgende_levering'],
        );

        if (! $isGelukt) {
            return redirect()
                ->route('leveranciers.levering.create', [$leverancier, $product])
                ->with('melding', "Het product {$levering->ProductNaam} van de leverancier {$levering->LeverancierNaam} wordt niet meer geproduceerd");
        }

        return redirect()
            ->route('leveranciers.producten', $leverancier)
            ->with('status', "De levering van {$levering->ProductNaam} is opgeslagen.");
    }

    private function findLeveringProduct(int $leverancier, int $product): object
    {
        $levering = $this->leveringModel->getLeveringProduct($leverancier, $product);

        abort_if($levering === null, 404);

        return $levering;
    }
}
