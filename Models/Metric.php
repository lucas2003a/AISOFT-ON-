<?php

require_once "Conection.php";

class Metric extends Conection{

    private $conection;

    public function __construct(){
        $this->conection = parent::getConection();
    }

    /**
     * Método para obtener las metrias de ventas de todos los proyectos
     */
    public function getMetricsAll(){

        try{

            $query = $this->conection->prepare("CALL spu_get_lots_status()");
            $query->execute();
            
            return $query->fetch(PDO::FETCH_ASSOC);
        }catch(Exception $e){
            die($e->getMessage());
        }
    }

   
    /**
     * Método para obtener las ventas en lo que va del año
     */
    public function getYearlySales(){

        try{

            $query = $this->conection->prepare("CALL spu_get_yearly_sales()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }
}
?>