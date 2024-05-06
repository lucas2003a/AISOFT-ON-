<?php

require_once "Conection.php";

class Budget extends Conection{

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    /**
     * Lista los presupuestos
    */
    public function listBudgets(){

        try{

            $query = $this->conection->prepare("CALL spu_list_budgets()");;
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Busca un presupuesto por el código
    */
    public function searchBudget($codigo = ""){
        try{

            $query = $this->conection->prepare("CALL spu_search_budgets(?)");
            $query->execute(array($codigo));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     *Obtiene un presupuesto por su id 
    */
    public function getBudgetById($idpresupuesto = 0){
        try{

            $query = $this->conection->prepare("CALL spu_get_budget_by_id(?)");
            $query->execute(array($idpresupuesto));

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Agrega un presupuesto
    */
    public function addBudget($dataBudget = []){
        try{

            $query = $this->conection->prepare("CALL spu_add_budget(?,?,?)");
            $query->execute(
                array(
                    $dataBudget["codigo"],
                    $dataBudget["modelo"],
                    $dataBudget["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Actualiza un presupuesto
    */
    public function setBudget($dataBudget = []){
        try{

            $query = $this->conection->prepare("CALL spu_set_budget(?,?,?,?)");
            $query->execute(
                array(
                    $dataBudget["idpresupuesto"],
                    $dataBudget["codigo"],
                    $dataBudget["modelo"],
                    $dataBudget["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }


    /**
     * Elimina un presupuesto
    */
    public function inactiveBudget($idpresupuesto){
        try{

            $query = $this->conection->prepare("CALL spu_inactive_budget(?)");
            $query->execute(array($idpresupuesto));

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}
?>