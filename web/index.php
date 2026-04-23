<?php
$conn = new mysqli("mysql", "usuario", "usuario123", "prueba");

if ($conn->connect_error) {
    die("Error: " . $conn->connect_error);
}

echo "Conexión OK a MySQL desde PHP en Docker";
?>
