<?php

require_once "Conection.php";

class UniteMeasurament extends Conection{

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    /**
     * Lista las unidades de medidas
     */
    public function listUnitMeasuraments(){

        try{

            $query = $this->conection->prepare("CALL spu_list_units_measuraments()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}
?>