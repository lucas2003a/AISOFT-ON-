<?php

$contrasenia = "peru2024";
$contraseniaEncript = password_hash($contrasenia,PASSWORD_BCRYPT);

var_dump($contraseniaEncript);
?>