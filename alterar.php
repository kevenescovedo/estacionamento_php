<?php 
require_once("db.php");
$response = "Dados Alterados com sucesso";
try {
$placa = $_POST["placa"];
$modelo = $_POST["modelo"];
$cor = $_POST["cor"];
$proprietario = $_POST['proprietario'];
$telefone = $_POST['telefone'];
$sql_insert = "UPDATE carro SET placa = '$placa', modelo = '$modelo', cor = '$cor', proprietario = '$proprietario', telefone = '$telefone' WHERE id =".$_GET['id'];
$db->query($sql_insert);
}catch(Exception $e) {
    echo $e;
    $response = "Falha ao Inserir";
}
header("Location: index.php?response=$response");

?>