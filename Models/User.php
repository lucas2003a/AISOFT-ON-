<?php

require_once "Conection.php";

class User extends Conection{

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    /**
     * Método para el logeo del usuario
     */
    public function loginUser($correo = ""){

        try{
            $query = $this->conection->prepare("CALL spu_user_login(?)");
            $query->execute(array($correo));

            return $query->fetch(PDO::FETCH_ASSOC);
        }catch(Exception $e){
            die($e->getMessage());
        }
    }
}        
?>