<?php
require_once "Conection.php";

class Cost extends Conection {

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    /**
     * Lista los costos por categoría
     */
    public function listCostsByCategory(){

        try{

            $query = $this->conection->prepare("CALL spu_list_cost_category()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Lista los costos por subcategoría dependiendo de ula categpría
     */
    public function listCostsBySubcategory($idcategoria_costo = 0){

        try{

            $query = $this->conection->prepare("CALL spu_list_cost_subcategory(?)");
            $query->execute(array($idcategoria_costo));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }


    // DETALLE DE COSTOS ///////////////////////////////////////////////////////
    
    /***
     * Lista los detalles de los costos por el idpresupuesto
     */
    public function listDetailCostIdBudget($idpresupuesto = 0){
        try{
            $query = $this->conection->prepare("CALL spu_list_detail_cost(?)");
            $query->execute(array($idpresupuesto));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
    
    /***
     * Agrega un detalle de costo
     */
    public function addDetailCost($dataCost = []){
        try{
            $query = $this->conection->prepare("CALL spu_add_detail_cost(?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataCost["idpresupuesto"],
                    $dataCost["idsubcategoria_costo"],
                    $dataCost["idmaterial"],
                    $dataCost["detalle"],
                    $dataCost["cantidad"],
                    $dataCost["precio_unitario"],
                    $dataCost["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /***
     * Actualiza un detalle de costo
     */
    public function setDetailCost($dataCost = []){
        try{
            $query = $this->conection->prepare("CALL spu_set_detail_cost(?,?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataCost["iddetalle_costo"],
                    $dataCost["idpresupuesto"],
                    $dataCost["idsubcategoria_costo"],
                    $dataCost["idmaterial"],
                    $dataCost["detalle"],
                    $dataCost["cantidad"],
                    $dataCost["precio_unitario"],
                    $dataCost["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /***
     * Elimina un detalle de costo
     */
    public function inactiveDetailCost($iddetalle_costo = 0){
        try{
            $query = $this->conection->prepare("CALL spu_inactive_cost(?)");
            $query->execute(array($iddetalle_costo));

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }


    //              REPORTES        //////////////////

    /**
     * Obtiene un resumen de costos por categoria por el idpresupuesto
     */
    public function resumeBudgetCategory($idpresupuesto = 0){

        try{
            $query = $this->conection->prepare("CALL spu_resume_budget_category(?)");
            $query->execute(array($idpresupuesto));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Obtiene un resumen de costos por subcategoria por el idpresupuesto
     */
    public function resumeBudgetSubategory($idpresupuesto = 0){

        try{
            $query = $this->conection->prepare("CALL spu_resume_budget_subcatgory(?)");
            $query->execute(array($idpresupuesto));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}
?>