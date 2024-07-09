<?php

require_once "Conection.php";

class User extends Conection
{

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    /**
     * Método para listar a los usuarios
     */
    public function listUsers(){
        try {
            $query = $this->conection->prepare("CALL spu_list_users()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    /**
     * Método para el logeo del usuario
     */
    public function loginUser($correo = "")
    {

        try {
            $query = $this->conection->prepare("CALL spu_user_login(?)");
            $query->execute(array($correo));

            return $query->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    /**
     * Método para listar los usuarios VENDEDORES O ASESORES DE VENTAS
     */
    public function chartEmployee()
    {

        try {
            $query = $this->conection->prepare("CALL spu_list_sellers()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    /**
     * Método para obtener los usuarios por el idusuario
     */
    public function getUser($idusuario)
    {
        try {
            $query = $this->conection->prepare("CALL spu_get_user(?)");
            $query->execute(array($idusuario));

            return $query->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    /**
     * Método para obtener las ultimas ventas del idusuario SI ES VENDEDOR
     */
    public function getSalesEmployee($idusuario)
    {
        try {
            $query = $this->conection->prepare("CALL spu_get_last_sales(?)");
            $query->execute(array($idusuario));
            
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    /**
     * Método para registrar un usuario
     */
    public function addUser($dataUser = [])
    {
        try {
            $query = $this->conection->prepare("CALL spu_add_user(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataUser['imagen'],
                    $dataUser['nombres'],
                    $dataUser['apellidos'],
                    $dataUser['documento_tipo'],
                    $dataUser['documento_nro'],
                    $dataUser['estado_civil'],
                    $dataUser['iddistrito'],
                    $dataUser['direccion'],
                    $dataUser['nacionalidad'],
                    $dataUser['correo'],
                    $dataUser['contrasenia'],
                    $dataUser['idrol'],
                    $dataUser['idsede']
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    /**
     * Método para actualizar un ususario
     */
    public function setUser($dataUser = [])
    {
        try {
            $query = $this->conection->prepare("CALL spu_set_user(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataUser['idusuario'],
                    $dataUser['imagen'],
                    $dataUser['idpersona'],
                    $dataUser['nombres'],
                    $dataUser['apellidos'],
                    $dataUser['documento_tipo'],
                    $dataUser['documento_nro'],
                    $dataUser['estado_civil'],
                    $dataUser['iddistrito'],
                    $dataUser['direccion'],
                    $dataUser['nacionalidad'],
                    $dataUser['correo'],
                    $dataUser['idrol'],
                    $dataUser['idsede']
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }
    /**
     * Método para dar de baja a un usuario
     */
    public function inactiveUser($idusuario){
        try {
            $query = $this->conection->prepare("CALL spu_inactive_user(?)");
            $query->execute(array($idusuario));

            return $query->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    /**
     * Método para obtenener a una persona por su número de documento
     */
    public function getPersonByDocument($documento_nro = ""){

        try {
            $query = $this->conection->prepare("CALL spu_list_person_doc_nro(?)");
            $query->execute(array($documento_nro));

            return $query->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }
}
