<?php

require_once "Conection.php";

class Material extends Conection{

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    /**
     *Lista los materiales por el idmarca
     */
    public function listMaterials($idmarca = 0){

        try{

            $query = $this->conection->prepare("CALL spu_list_materials(?)");
            $query->execute(array($idmarca));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Lista los tipos de materiales por el idmaterial
     */
    public function listTypeMaterials($idmaterial = 0){

        try{

            $query = $this->conection->prepare("CALL spu_list_types_materials(?)");
            $query->execute(array($idmaterial));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}
?>