<?php

require_once "Conection.php";

class Client extends Conection{

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    /**
     * Obtengo el cliente por el ID
     */
    public function getClientById($idcliente = 0){
        
        try{

            $query = $this->conection->prepare("CALL spu_list_clients_by_id(?)");
            $query->execute(array($idcliente));

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para listar los clientes distintguiendo el tipo de persona
     */
    public function listClientsTperson($tipo_persona = ""){

        try{

            $query =  $this->conection->prepare("CALL spu_list_clients_tpersona(?)");
            $query->execute(array($tipo_persona));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
    /**
     * Métodos para listar los clientes por su número de documento
     */
    public function listClientsDnro($dataClient = []){

        try{

            $query = $this->conection->prepare("CALL spu_list_clients_by_docNro(?,?)");
            $query->execute(array(

                $dataClient["tipo_persona"],
                $dataClient["documento_nro"],
            ));

            return $query->fetchAll(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    //PERSONAS NATURALES

    /**
     * Método para registrar cliente como persona natural
     */
    public function addClientNatural($dataClient = []){

        try{

            $query = $this->conection->prepare("CALL spu_add_clients_personN(?,?,?,?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataClient["tipo_persona"],
                    $dataClient["nombres"],
                    $dataClient["apellidos"],
                    $dataClient["documento_tipo"],
                    $dataClient["documento_nro"],
                    $dataClient["estado_civil"],
                    $dataClient["iddistrito"],
                    $dataClient["direccion"],
                    $dataClient["nacionalidad"],
                    $dataClient["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para actualizar los registros de un cliente
     */
    public function setClientNatural($dataClient = []){

        try{

            $query = $this->conection->prepare("CALL spu_set_clientN(?,?,?,?,?,?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataClient["idcliente"],
                    $dataClient["tipo_persona"],
                    $dataClient["idpersona"],
                    $dataClient["nombres"],
                    $dataClient["apellidos"],
                    $dataClient["documento_tipo"],
                    $dataClient["documento_nro"],
                    $dataClient["estado_civil"],
                    $dataClient["iddistrito"],
                    $dataClient["direccion"],
                    $dataClient["nacionalidad"],
                    $dataClient["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    //PERSONAS JURÍDICCAS

    /**
     * Método para registrar una persona jurídica
     */
    public function addLegalClient($dataClient = []){

        try{

            $query = $this->conection->prepare("CALL spu_add_clients_personj(?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataClient["tipo_persona"],
                    $dataClient["razon_social"],
                    $dataClient["documento_tipo"],
                    $dataClient["documento_nro"],
                    $dataClient["iddistrito"],
                    $dataClient["direccion"],
                    $dataClient["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        
        catch(Exception $e){
            die($e->getMessage());
        }
    }

     /**
     * Método para actualizar a una persoma jurídica
     */
    public function setLegalClient($dataClient = []){

        try{

            $query = $this->conection->prepare("CALL spu_set_clientJ(?,?,?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataClient["idcliente"],
                    $dataClient["tipo_persona"],
                    $dataClient["idpersona_juridica"],
                    $dataClient["razon_social"],
                    $dataClient["documento_tipo"],
                    $dataClient["documento_nro"],
                    $dataClient["iddistrito"],
                    $dataClient["direccion"],
                    $dataClient["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        }
        
        catch(Exception $e){
            die($e->getMessage());
        }
    }


    /**
     * Método para registrar a los representantes legales
     */
    public function addRepresents($dataClient = []){

        try{

            $query = $this->conection->prepare("CALL spu_add_represents(?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataClient["idpersona_juridica"],
                    $dataClient["representate_legal"],
                    $dataClient["documento_tipo"],
                    $dataClient["documento_nro"],
                    $dataClient["cargo"],
                    $dataClient["partida_elect"],
                    $dataClient["estado"],
                )
            );
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para eliminar a un cliente
     */
    public function inactiveClient($idcliente = 0){
        
        try{

            $query = $this->conection->prepare("CALL spu_inactive_clients(?)");
            $query->execute(array($idcliente));

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }
}

?>