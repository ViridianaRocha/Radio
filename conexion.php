<?php
    $conexion = new mysqli("fdb1030.awardspace.net", "4585362_radio", "Temp-Oral4", "4585362_radio");
    if($conexion){
        echo "Exitoso!";
    } else{
        echo "Algo salio mal";
    }
?>