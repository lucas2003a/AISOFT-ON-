<?php

$contrasenia = "contraseña";
$contraseniaEncript = password_hash($contrasenia,PASSWORD_BCRYPT);

var_dump($contraseniaEncript);
?>