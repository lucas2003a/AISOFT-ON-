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
}
