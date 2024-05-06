<?php

require_once "Conection.php";

class Brand extends Conection{

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    /**
     * Lista las marcas
     */
    public function listBrands(){

        try{

            $query = $this->conection->prepare("CALL spu_list_brands()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}
?>