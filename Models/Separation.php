<?php

require_once "Conection.php";

class Separation extends Conection{

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    /**
     * Lista todas las separaciones exeptuando las eliminadas
     */
    public function listSeparations(){
        try{

            $query = $this->conection->prepare("CALL spu_list_separations()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para listar las separaciones en base a 3 criterios(Tipo de persona, fecha inicio,fecha fin)
     */
    public function listSeparationsTPersona($dataSep = []){

        try{

            $query = $this->conection->prepare("CALL spu_list_separation_tPersona(?,?,?)");
            $query->execute(
                array(
                    $dataSep["tipoPersona"],
                    $dataSep["fechaInicio"],
                    $dataSep["fechaFin"]
                )
            );

            return $query->fetchAll(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para listar las separaciones en base a 4 criterios(Tipo de persona, fecha inicio,fecha fin, nº expediente)
     */
    public function listSeparationsNExpediente($dataSep = []){

        try{

            $query = $this->conection->prepare("CALL spu_list_separation_n_expediente_docNro(?,?,?,?)");
            $query->execute(
                array(
                    $dataSep["tipoPersona"],
                    $dataSep["fechaInicio"],
                    $dataSep["fechaFin"],
                    $dataSep["campoCriterio"]
                )
            );

            return $query->fetchAll(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para listar una separación en base a un idseparacion
     */
    public function listSeparationById($idseparacion = 0){

        try{

            $query = $this->conection->prepare("CALL spu_get_separation_ById(?)");
            $query->execute(array($idseparacion));

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para obtener los datos de la separación por el idavtivo
     */
    public function listByIdAsset($idactivo = 0){

        try{

            $query = $this->conection->prepare("CALL spu_list_separation_ByIdAsset(?)");
            $query->execute(array($idactivo));

            return $query->fetch(PDO::FETCH_ASSOC);
            
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para registrar una separación
     */
    public function addSeparation($dataSep = []){

        try{
            $query = $this->conection->prepare("CALL spu_add_separation(?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataSep["n_expediente"],
                    $dataSep["idactivo"],
                    $dataSep["idcliente"],
                    $dataSep["idconyugue"],
                    $dataSep["separacion_monto"],
                    $dataSep["imagen"],
                    $dataSep["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para actualizar una separación
     */
    public function setSeparation($dataSep = []){

        try{
            $query = $this->conection->prepare("CALL spu_set_separation(?,?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataSep["idseparacion"],
                    $dataSep["n_expediente"],
                    $dataSep["idactivo"],
                    $dataSep["idcliente"],
                    $dataSep["idconyugue"],
                    $dataSep["separacion_monto"],
                    $dataSep["imagen"],
                    $dataSep["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para eliminar una separación
     */
    public function inactiveSeparation($dataSep = []){
        try{
            $query = $this->conection->prepare("CALL spu_inactive_separation(?,?)");
            $query->execute(
                array(
                    $dataSep["idseparacion"],
                    $dataSep["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Metodo para obtener los nuevos clientes
     */
    public function listNewClients(){

        try{

            $query = $this->conection->prepare("CALL spu_get_new_clients()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
            
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}
?>