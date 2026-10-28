<?php

namespace App\Models;

/**
 * Leveranciers van Jamin, opgehaald via stored procedures (PDO).
 */
class LeverancierModel extends StoredProcedureModel
{
    /**
     * Alle leveranciers met het aantal verschillende producten dat zij leveren,
     * gesorteerd op dat aantal aflopend.
     *
     * @return array<int, object>
     */
    public function getAll(): array
    {
        return $this->call('sp_GetAllLeveranciers');
    }

    public function getById(int $leverancierId): ?object
    {
        return $this->callFirst('sp_GetLeverancierById', [$leverancierId]);
    }

    /**
     * De verschillende producten die de leverancier aan Jamin heeft geleverd,
     * gesorteerd op Aantal in magazijn aflopend.
     *
     * @return array<int, object>
     */
    public function getGeleverdeProducten(int $leverancierId): array
    {
        return $this->call('sp_GetGeleverdeProductenByLeverancierId', [$leverancierId]);
    }
}
