<?php

require_once "Conection.php";

class Asset extends Conection{

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    /**
     * Método para listar los lotes por el idproyecto
     */
    public function listAssetByIdProyect($idproyecto = 0){

        try{

            $query = $this->conection->prepare("CALL spu_list_assets_idProject(?)");
            $query->execute(array($idproyecto));

            return $query->fetchAll(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }
    /**
     * Método para listar los lotes por el idproyecto y el tipo de persona
     */
    public function listAssetProjectId($dataAsset = []){

        try{

            $query = $this->conection->prepare("CALL spu_list_assets_short_idpr(?,?)");
            $query->execute(array(

                $dataAsset["idproyecto"],
                $dataAsset["propietario_lote"]
            ));

            return $query->fetchAll(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para listar un lote por el idactivo
     */
    public function listAssetId($idactivo = 0){

        try{

            $query = $this->conection->prepare("CALL spu_list_assets_by_id(?)");
            $query->execute(array($idactivo));

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para lista un lote por el idproyecto y el código del lote
     */
    public function listAssetPASublote($dataAsset = []){

        try{

            $query = $this->conection->prepare("CALL spu_list_assets_by_sublote(?,?)");
            $query->execute(
                array(
                    $dataAsset["idproyecto"],
                    $dataAsset["sublote"],
                )
            );

            return $query->fetchAll(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para registrar un lote
     */
    public function addAsset($dataAsset = []){

        try{

            $query = $this->conection->prepare("CALL spu_add_assets(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataAsset["idproyecto"],
                    $dataAsset["tipo_activo"],
                    $dataAsset["imagen"],
                    $dataAsset["estado"],
                    $dataAsset["sublote"],
                    $dataAsset["direccion"],
                    $dataAsset["moneda_venta"],
                    $dataAsset["area_terreno"],
                    $dataAsset["zcomunes_porcent"],
                    $dataAsset["partida_elect"],
                    $dataAsset["latitud"],
                    $dataAsset["longitud"],
                    $dataAsset["perimetro"],
                    $dataAsset["idpresupuesto"],
                    $dataAsset["propietario_lote"],
                    $dataAsset["precio_lote"],
                    $dataAsset["precio_construccion"],
                    $dataAsset["precio_venta"],
                    $dataAsset["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para actualizar un lote
     */
    public function setAsset($dataAsset = []){
         
        try{

            $query = $this->conection->prepare("CALL spu_set_assets(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataAsset["idactivo"],
                    $dataAsset["idproyecto"],
                    $dataAsset["tipo_activo"],
                    $dataAsset["imagen"],
                    $dataAsset["estado"],
                    $dataAsset["sublote"],
                    $dataAsset["direccion"],
                    $dataAsset["moneda_venta"],
                    $dataAsset["area_terreno"],
                    $dataAsset["zcomunes_porcent"],
                    $dataAsset["partida_elect"],
                    $dataAsset["latitud"],
                    $dataAsset["longitud"],
                    $dataAsset["perimetro"],
                    $dataAsset["idpresupuesto"],
                    $dataAsset["propietario_lote"],
                    $dataAsset["precio_lote"],
                    $dataAsset["precio_construccion"],
                    $dataAsset["precio_venta"],
                    $dataAsset["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para "inactivar" un lote
     */
    public function inactiveAsset($dataAsset = []){

        try{

            $query = $this->conection->prepare("CALL spu_inactive_assets(?,?)");
            $query->execute(
                array(
                    $dataAsset["idactivo"],
                    $dataAsset["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para recuperar un lote "inactivo"
     */
    public function restoreAsset($idactivo = 0){
         
        try{

            $query = $this->conection->prepare("CALL spu_restore_assets(?)");
            $query->execute(array($idactivo));

            return $query->fetch(PDO::FETCH_ASSOC);
            
        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para actualizar los detalles de la casa de un lote
     * 
     */
    public function setDetAssetBuid($dataAsset = []){

        try{

            $query =  $this->conection->prepare("CALL spu_set_det_build(?,?,?)");
            $query->execute(
                array(

                    $dataAsset["idactivo"],
                    $dataAsset["det_casa"],
                    $dataAsset["idusuario"],
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
    
    /**
     * Método para listar los lotes para los reportes
     */
    public function getLotsReports($idproyecto = 0){

        try{
            
            $query = $this->conection->prepare("CALL spu_get_lot_reports(?)");
            $query->execute(array($idproyecto));

            return $query->fetchAll(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para actualizar el idpresupuesto
     */
    public function setIdBudget($dataAsset = []){

        try{

            $query = $this->conection->prepare("CALL spu_set_idpresupuesto(?,?,?)");
            $query->execute(
                array(
                    $dataAsset["idactivo"],
                    $dataAsset["idpresupuesto"],
                    $dataAsset["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Lista los lotes sin sin presupuesto
     */
    public function listLotsNoBudgets(){

        try{

            $query = $this->conection->prepare("CALL spu_list_lots_noBudgets()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Lista los lotes con presupuesto 
     */
    public function listLotsWithBudget(){

        try{

            $query = $this->conection->prepare("CALL spu_list_lots_withBudgets()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Lista los lotes por el idpresupuesto
     */
    public function listLotsByIdpresupuesto($idpresupuesto = 0){

        try{

            $query = $this->conection->prepare("CALL spu_list_lots_ByIdBudget(?)");
            $query->execute(array($idpresupuesto));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Lista los lotes si contienen o no contien el idpresupuesto
     */
    public function listLostForBudget($idpresupuesto = 0){

        try{

            $query = $this->conection->prepare("CALL spu_list_lots_ForBudget(?)");
            $query->execute(array($idpresupuesto));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Lista solo los LOTES en estado SIN VENDER
     */
    public function listOnlyLots(){
        try{
            
            $query = $this->conection->prepare("CALL spu_list_onlyLots()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}
?>