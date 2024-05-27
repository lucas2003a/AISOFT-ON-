<?php

require_once "Conection.php";

class Quota extends Conection{

    private $conection;

    public function __construct(){

        $this->conection = parent::getConection();
    }

}
?>