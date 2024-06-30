<?php 
require_once "Conection.php";

class Permission extends Conection{

    private $conection;

    public function __construct() {
        $this->conection = parent:: getConection();
    }

    /**
     * * Obtiene los permisos por el idrol
     */
    public function getPermissionByRol($idrol = 0) {
        try {
            
            $query = $this->conection->prepare("call spu_list_permissions(?)");
            $query->execute(array($idrol));

            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }

    }
}
?>