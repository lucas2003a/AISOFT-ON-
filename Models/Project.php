<?php

require_once "../Models/Conection.php";

class Project extends Conection{

    private $conection;

    public function __construct()
    {
        $this->conection = parent::getConection();
    }

    /**
     * Método para listar los proyectos activos
     */
    public function listProject(){

        try{


            $query = $this->conection->prepare("CALL spu_list_projects()");
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para listar los proyectos activos por id
     */
    public function listProjectId($idproyecto = 0){

        try{


            $query = $this->conection->prepare("CALL spu_list_projects_id(?)");
            $query->execute(array($idproyecto));

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para listar los proyectos activos (busqueda por código)
     */
    public function listProjectCode($code = ""){

        try{

            $query = $this->conection->prepare("CALL spu_list_projects_by_code(?)");
            $query->execute(array($code));

            return $query->fetchAll(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para registrar un proyecto
     */
    public function addProject($dataProject = []){

        try{

            $query = $this->conection->prepare("CALL spu_add_projects(?,?,?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataProject["idsede"],
                    $dataProject["imagen"],
                    $dataProject["codigo"],
                    $dataProject["denominacion"],
                    $dataProject["latitud"],
                    $dataProject["longitud"],
                    $dataProject["iddistrito"],
                    $dataProject["direccion"],
                    $dataProject["idusuario"]
                )
            );
            
            return $query->fetch(PDO::FETCH_ASSOC);
            
        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Mètodo para actualizar un proyecto
     */
    public function setProject($dataProject = []){
        
        try{

            $query = $this->conection->prepare("CALL spu_set_projects(?,?,?,?,?,?,?,?,?,?)");
            $query->execute(
                array(
                    $dataProject["idproyecto"],
                    $dataProject["idsede"],
                    $dataProject["imagen"],
                    $dataProject["codigo"],
                    $dataProject["denominacion"],
                    $dataProject["latitud"],
                    $dataProject["longitud"],
                    $dataProject["iddistrito"],
                    $dataProject["direccion"],
                    $dataProject["idusuario"]
                )
            );

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    /**
     * Método para inactivar un proyecto
     */
    public function inactiveProject($idproyecto = 0){

        try{

            $query =$this->conection->prepare("CALL spu_inactive_projects(?)");
            $query->execute(array($idproyecto));

            return $query->fetch(PDO::FETCH_ASSOC);

        }catch(Exception $e){
            die($e->getMessage());
        }
    }
}
?>