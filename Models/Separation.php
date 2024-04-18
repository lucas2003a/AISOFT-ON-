<?php

require_once "Conection.php";

class Separation extends Conection{

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    public function listSeparations(){

        try{

            $query = $this->conection->prepare("CALL spu_lis_separations()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    public function listByIdAsset($idactivo = 0){

        try{

            $query = $this->conection->prepare("CALL spu_list_separation_ByIdAsset(?)");
            $query->execute(array($idactivo));

            return $query->fetch(PDO::FETCH_ASSOC);
            
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    public function listNewClients(){

        try{

            $query = $this->conection->prepare("CALL spu_get_new_clients()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
            
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}
?>