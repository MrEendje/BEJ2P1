<?php

namespace App\Http\Controllers;

use App\Models\LeverancierModel;
use Illuminate\View\View;

class LeverancierController extends Controller
{
    public function __construct(private LeverancierModel $leverancierModel)
    {
    }

    /**
     * Scherm Overzicht leveranciers: alle leveranciers met het aantal
     * verschillende producten dat zij leveren, op dat aantal aflopend.
     */
    public function index(): View
    {
        return view('leverancier.index', [
            'leveranciers' => $this->leverancierModel->getAll(),
        ]);
    }

    /**
     * Scherm Geleverde producten: de verschillende producten van één leverancier,
     * op Aantal in magazijn aflopend.
     */
    public function producten(int $leverancier): View
    {
        $gegevens = $this->leverancierModel->getById($leverancier);

        abort_if($gegevens === null, 404);

        return view('leverancier.producten', [
            'leverancier' => $gegevens,
            'producten' => $this->leverancierModel->getGeleverdeProducten($leverancier),
        ]);
    }
}
