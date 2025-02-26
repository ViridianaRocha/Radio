<?php
include 'conexion.php';

if (isset($_GET['frecuencia'])) {
    $frecuencia = $_GET['frecuencia'];

    $query = "SELECT e.nombre, e.generoMusical, l.nombre AS locutor 
              FROM estaciones e 
              JOIN locutor l ON e.id_estacion = l.id_estacion 
              WHERE e.frecuencia = '$frecuencia'";
    
    $result = mysqli_query($conexion, $query);

    echo "<h2>Información de la Estación</h2>";

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<p>Nombre: {$row['nombre']}</p>";
            echo "<p>Género Musical: {$row['generoMusical']}</p>";
            echo "<p>Locutor: {$row['locutor']}</p>";
        }
    } else {
        echo "<p>No se encontraron datos para esta frecuencia.</p>";
    }
}
?>

