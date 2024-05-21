<?php

require_once "Conection.php";

class Refund extends Conection{

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    /**
     * Método para listar las devoluciones en base a 3 criterios(tipo de persona, fechaInicio, fechaFin)
     */
    public function listRefunds($dataDev){
        try{

            $query = $this->conection->prepare("CALL sup_list_refunds(?,?,?)");
            $query->execute(
                array(
                    $dataDev["tipo_persona"], 
                    $dataDev["fechaInicio"], 
                    $dataDev["fechaFin"]
                )
            );

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para listar las devoluciones en base a 4 criterios(tipo de persona, fechaInico, fechaFin, n_expedientes)
     */
    public function listRefundsNExpedientes($dataDev = []){
        try{
            $query = $this->conection->prepare("CALL sup_list_refunds_n_expedientes(?,?,?,?)");
            $query->execute(
                array(
                    $dataDev["tipo_persona"],
                    $dataDev["fechaInicio"],
                    $dataDev["fechaFin"],
                    $dataDev["n_expedientes"]
                    )
                );

            return $query->fetchAll(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para listar las devoluciones por su iddevolucion
     */
    public function listRefundsById($iddevolucion = 0){
        try{
            $query = $this->conection->prepare("CALL sup_list_refunds_ById(?)");
            $query->execute(array($iddevolucion));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para registrar una devolucion
     */
    public function addRefund($dataDev = []){
        try{
            $query = $this->conection->prepare("CALL sup_add_refund(?,?,?,?,?,?");
            $query->execute(
                array(
                    $dataDev["n_expediente"],
                    $dataDev["idseparacion"],
                    $dataDev["detalle"],
                    $dataDev["monto_devolucion"],
                    $dataDev["imagen"],
                    $dataDev["idusuario"]
                )
                );

            return $query->fetch(PDO::FETCH_ASSOC);
        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para actualizar una devolucion
     */
    public function setRefund($dataDev = []){
        try{
            $query = $this->conection->prepare("CALL spu_set_refund(?,?,?,?,?,?,?");
            $query->execute(
                array(
                    $dataDev["iddevolucion"],
                    $dataDev["n_expediente"],
                    $dataDev["idseparacion"],
                    $dataDev["detalle"],
                    $dataDev["monto_devolucion"],
                    $dataDev["imagen"],
                    $dataDev["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para eliminar una devolución
     */
    public function inactiveRefund($dataDev = []){
        try{
            $query = $this->conection->prepare("CALL spu_inactive_refund(?,?)");
            $query->execute(
                array(
                    $dataDev["iddevolucion"],
                    $dataDev["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}
?>