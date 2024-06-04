<?php
require_once "../Models/Conection.php";

class Represent extends Conection{

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    /**
     * Método para listar a los REPRESENTANTES POR SEDE  por su id
     */
    public function getRepresentsId($idrepresentante = 0){

        try{
            $query = $this->conection->prepare("CALL spu_get_represents(?)");
            $query->execute(array($idrepresentante));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para listar a los REPRESENTANTES POR SEDE  por el idsede
     */
    public function getRepresentsIdAdress($idsede = 0){

        try{
            $query = $this->conection->prepare("CALL spu_get_represents_idAdress(?)");
            $query->execute(array($idsede));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}
?>