<?php

require_once "Conection.php";

class Quota extends Conection{

    private $conection;

    public function __construct(){

        $this->conection = parent::getConection();
    }

    /**
     * Método que obtiene todas las cuentas,sn excepción
     */
    public function listQuotasAll(){
        try {
            $query  = $this->conection->prepare("CALL spu_list_quotas_all()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);

        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    /**
     * Método que lista los las cuotas por su idcontrato
     */
    public function listQuotasIdcontract($idcontrato = 0){
        try{

            $query = $this->conection->prepare("CALL spu_list_quotas_idcontrato(?)");
            $query->execute(array($idcontrato));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método que obtiene una cuota por su propio id
     */
    public function getQuotaId($idcuota = 0){
        try{
            $query = $this->conection->prepare("CALL spu_list_quotas_ById(?)");
            $query->execute(array($idcuota));

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método que obtiene las cuotas, de acuerdo al estado
     */
    public function getQuotasState($dataQuotas = []){
        try {
            $query = $this->conection->prepare("CALL spu_list_quotas_estado(?,?)");
            $query->execute(
                array(
                    $dataQuotas['idcontrato'],
                    $dataQuotas['estado']
                )
            );

            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    /**
     * Metodo que obitne las cuotas de acuerdo al estado y la fecha de vencimiento
     */
    public function getQuotasStateDate($dataQuotas = []){

        try {
            
            $query = $this->conection->prepare("CALL spu_list_quotas_estado_fven(?,?,?)");
            $query->execute(
                array(
                    $dataQuotas['idcontrato'],
                    $dataQuotas['estado'],
                    $dataQuotas['fecha_vencimiento']
                )
            );

            return $query->fetchAll(PDO::FETCH_ASSOC);

        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    /**
     * Método para actualizar el estado de forma automática
     */
    public function updateQuotasState($dataQuotas = []){
        try {
            
            $query = $this->conection->prepare("CALL spu_set_statusQuota_automaticly(?,?)");
            $query->execute(
                array(
                    $dataQuotas['idcuota'],
                    $dataQuotas['estado']
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }            
    }

    /**
     * Métoodo para registrar una cuota
     */
    public function addQuota($dataQuotas = []){
        try{
            
            $query = $this->conection->prepare("CALL spu_add_quota(?,?,?,?)");
            $query->execute(
                array(
                    $dataQuotas['idcontrato'],
                    $dataQuotas['monto_cuota'],
                    $dataQuotas['fecha_vencimiento'],
                    $dataQuotas['idusuario']
                )
            );
            
            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para actualizar un pago
     */
    public function setQuota($dataQuotas = []){
        try{
            
            $query = $this->conection->prepare("CALL spu_set_det_quota(?,?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataQuotas['idcuota'],
                    $dataQuotas['fecha_pago'],
                    $dataQuotas['monto_pago'],
                    $dataQuotas['detalles'],
                    $dataQuotas['tipo_pago'],
                    $dataQuotas['entidad_bancaria'],
                    $dataQuotas['imagen'],
                    $dataQuotas['idusuario']
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para anular una cuota
     */
    public function cancelQuota($idcuota = []){
        try{
                
            $query = $this->conection->prepare("CALL spu_cancel_quota(?,?)");
            $query->execute(
                array(
                    $idcuota["idcuota"],
                    $idcuota['idusuario']
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para eiminar una cuota
     */
    public function inactiveQuota($idcuota = 0){
        try{
            $query = $this->conection->prepare("CALL spu_inactive_quota(?,?)");
            $query->execute(array($idcuota));

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

}
?>