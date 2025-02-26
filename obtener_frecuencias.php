<?php
include 'conexion.php';

$query = "SELECT frecuencia_mhz FROM frecuencias";
$result = mysqli_query($conexion, $query);

$frecuencias = [];
while ($row = mysqli_fetch_assoc($result)) {
    $frecuencias[] = $row;
}

echo json_encode($frecuencias);
?>