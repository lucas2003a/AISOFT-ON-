<?php

require_once "Conection.php";

class Configuration extends Conection{

    private $conection;

    public function __construct(){
        $this->conection = parent::getConection();
    }

    /**
     * Obtiene la configuracion en vase a una clave ("clave" => "valor")
     */
    public function listConfig($clave = ""){

        try{
            $query = $this->conection->prepare("CALL spu_list_configs(?)");
            $query->execute(array($clave));

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Modifica o registra un valor en configuraciones
     */
    public function upsetConfig($dataConfing = []){
        try{
            $query = $this->conection->prepare("CALL spu_upset_config(?,?)");
            $query->execute(
                array(
                    $dataConfing['clave'],
                    $dataConfing['valor']
                )
            );

        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}
?>