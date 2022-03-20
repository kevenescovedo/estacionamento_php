<?php 
require_once("db.php");
try{
$sql_insert = "DELETE FROM carro WHERE id =".$_GET['id']; 

$db->query($sql_insert);
}
catch(Exception $e) {
    echo $e;
    $response = "Falha ao Inserir";
}
header("Location: listar.php");

?>