<?php 

require_once "Conection.php";

class Rol extends Conection{

    private $conection;

    public function __construct(){
        $this->conection = parent::getConection();
    }

    /**
     * Método para listar los roles
     */
    public function getRols(){
        try {
            $query = $this->conection->prepare("CALL spu_list_rols()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }
}