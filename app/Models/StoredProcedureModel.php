<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use PDO;

/**
 * Basisklasse voor modellen die de Jamin-database benaderen via
 * stored procedures en PDO (prepared statements).
 */
abstract class StoredProcedureModel
{
    protected PDO $pdo;

    public function __construct()
    {
        $this->pdo = DB::connection('jamin')->getPdo();
    }

    /**
     * Roept een stored procedure aan en geeft alle rijen terug als objecten.
     *
     * @param  array<int, int|string|null>  $parameters
     * @return array<int, object>
     */
    protected function call(string $procedure, array $parameters = []): array
    {
        $placeholders = implode(', ', array_fill(0, count($parameters), '?'));
        $statement = $this->pdo->prepare("CALL {$procedure}({$placeholders})");

        foreach (array_values($parameters) as $index => $value) {
            $statement->bindValue($index + 1, $value, match (true) {
                is_int($value) => PDO::PARAM_INT,
                is_null($value) => PDO::PARAM_NULL,
                default => PDO::PARAM_STR,
            });
        }

        $statement->execute();
        $rows = $statement->fetchAll(PDO::FETCH_OBJ);
        $statement->closeCursor();

        return $rows;
    }

    /**
     * Roept een stored procedure aan en geeft alleen de eerste rij terug.
     *
     * @param  array<int, int|string|null>  $parameters
     */
    protected function callFirst(string $procedure, array $parameters = []): ?object
    {
        return $this->call($procedure, $parameters)[0] ?? null;
    }
}
