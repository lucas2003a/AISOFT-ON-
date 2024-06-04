<?php

require_once "../Models/Conection.php";

class Contract extends Conection{

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    /**
     * Método poara listar todos los contratos
     */
    public function listContracts(){
        try{
            $query = $this->conection->prepare("CALL spu_list_contractsAll()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Lista los contratos por el tipo de contrato
     */
    public function listContractByType($typeContract = ""){
        try{
            $query = $this->conection->prepare("CALL spu_list_contracts_types(?)");
            $query->execute(array($typeContract));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Lista los contatos por su tipo y por su fecha
     */
    public function listContractsByTypeDate($dataContract= []){
        try{
            $query = $this->conection->prepare("CALL spu_list_contracts_types_date(?,?,?)");
            $query->execute(
                array(
                    $dataContract['tipo_contrato'],
                    $dataContract['fecha_inicio'],
                    $dataContract['fecha_fin']
                )
            );
            
            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Lista los contatos por su tipo, por su fecha y su número de expedieente
     */
    public function listContractsByTypeDateNexpediente($dataContract= []){
        try{
            $query = $this->conection->prepare("CALL spu_list_contracts_types_date_n_expediente(?,?,?,?)");
            $query->execute(
                array(
                    $dataContract['tipo_contrato'],
                    $dataContract['fecha_inicio'],
                    $dataContract['fecha_fin'],
                    $dataContract['n_expediente']
                )
            );
            
            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para verificar si existe un contrato con el idcontrato
     */
    public function existsContractIdContract($idcontrato =0 ){
        try{

            $query = $this->conection->prepare("CALL spu_existContract(?)");
            $query->execute(array($idcontrato));

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para verficar si existe un contratodo por el idseparacion
     */
    public function existContract($idseparacion = 0){
        try{

            $query = $this->conection->prepare("CALL spu_existContract_idseparacion(?)");
            $query->execute(array($idseparacion));

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para listar el constrato completo por el idcontrato
     */
    public function listContractId($idcontrato = 0){

        try{

            $query = $this->conection->prepare("CALL spu_lits_contracts_full_by_id(?)");
            $query->execute(array($idcontrato));

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para registrar un contrato
     */
    public function addContract($dataContract = []){

        try{

            $query = $this->conection->prepare("CALL spu_add_contracts(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataContract["n_expediente"],
                    $dataContract["tipo_contrato"],
                    $dataContract["idseparacion"],
                    $dataContract["idrepresentante_primario"],
                    $dataContract["idrepresentante_secundario"],
                    $dataContract["idcliente"],
                    $dataContract["idconyugue"],
                    $dataContract["idactivo"],
                    $dataContract["tipo_cambio"],
                    $dataContract["estado"],
                    $dataContract["fecha_contrato"],
                    $dataContract["precio_venta"],
                    $dataContract["det_contrato"],
                    $dataContract["archivo"],
                    $dataContract["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para actualizar un contrato
     */
    public function setContract($dataContract = []){

        try{

            $query = $this->conection->prepare("CALL spu_set_contracts(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataContract["idcontrato"],
                    $dataContract["n_expediente"],
                    $dataContract["tipo_contrato"],
                    $dataContract["idseparacion"],
                    $dataContract["idrepresentante_primario"],
                    $dataContract["idrepresentante_secundario"],
                    $dataContract["idcliente"],
                    $dataContract["idconyugue"],
                    $dataContract["idactivo"],
                    $dataContract["tipo_cambio"],
                    $dataContract["estado"],
                    $dataContract["fecha_contrato"],
                    $dataContract["precio_venta"],
                    $dataContract["det_contrato"],
                    $dataContract["archivo"],
                    $dataContract["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para inactivar un contrato
     */
    public function inactiveContract($dataContract = []){

        try{
            
            $query = $this->conection->prepare("CALL spu_inactive_contracts(?,?)");
            $query->execute(
                array(
                    $dataContract["idcontrato"],
                    $dataContract["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /************************************************************  DETALLES DEL CONTRATO  **********************************************************/
    
    /**
     * Método para listar los detalles de un contrato por el idactivo
     */
    public function listDetContract($idcontrato = 0){

        try{

            $query = $this->conection->prepare("CALL spu_list_det_contracts(?)");
            $query->execute(array($idcontrato));

            return $query->fetchAll(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para listar los detalles del contrato por el id del detalle
     */
    public function listDetContractById($iddetalle_contrato = 0){
        try{
            $query = $this->conection->prepare("CALL spu_list_det_contract_ById(?)");
            $query->execute(array($iddetalle_contrato));

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para registrar un nuevo detalle a los detalles del contrato
     */
    public function addDetContract($dataDetCont = []){

        try{

            $query = $this->conection->prepare("CALL spu_add_det_contract(?,?)");
            $query->execute(
                array(
                    $dataDetCont["idrepresentante"],
                    $dataDetCont["idcontrato"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para actualizar los registros del detalle de los contratos
     */
    public function setDetContract($dataDetCont = []){

        try{

            $query = $this->conection->prepare("CALL spu_set_det_contract(?,?,?,?)");
            $query->execute(
                array(
                    $dataDetCont["iddetalle_contrato"],
                    $dataDetCont["idrepresentante"],
                    $dataDetCont["idcontrato"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para inactivar un registro del detalle de los contratos
     */
    public function inactiveDetCont($iddetalle_contrato = 0){

        try{

            $query = $this->conection->prepare("CALL spu_inactive_det_contract(?)");
            $query->execute(array($iddetalle_contrato));

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }
}

?>