<?php

require_once "Conection.php";

class Update extends Conection{

    private $conection;

    public function __construct(){
        $this->conection = parent::getConection();
    }

    /**
     * Registra actualizaciones realizadas
     */
    public function update($dataUpdate = []){
        try {
            $query = $this->conection->prepare("CALL spu_add_update(?,?,?,?)");
            $query->execute(
                array(
                    $dataUpdate['objeto_cambio'],
                    $dataUpdate['motivo'],
                    $dataUpdate['detalle'],
                    $dataUpdate['usuario']
                )
            );
        } catch (\Throwable $th) {
            //throw $th;
        }
    }
}

?>