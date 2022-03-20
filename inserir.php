<?php 
require_once("db.php");
$response = "Dados Inseridos com sucesso";
try {
$placa = $_POST["placa"];
$modelo = $_POST["modelo"];
$cor = $_POST["cor"];
$proprietario = $_POST['proprietario'];
$telefone = $_POST['telefone'];
$sql_insert = "INSERT INTO carro (placa,modelo,cor,proprietario,telefone) VaLUES ('$placa','$modelo','$cor','$proprietario','$telefone')";
$db->query($sql_insert);
}catch(Exception $e) {
    echo $e;
    $response = "Falha ao Inserir";
}
header("Location: index.php?response=$response");

?>