<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estacionamento</title>
    <style>
    </style>
</head>
<body>
    <a href= "listar.php">Ver carros</a>
    <div id="conteudo">
    <h1>Estacionamento</h1>
<?php 
$action = "inserir.php";
$placa = "";
$modelo = "";
$cor = "";
$proprietario = "";
$telefone = "";

?>
    <?php if(isset($_GET['placa'])) {
  $action = "alterar.php";
   require_once("db.php");
$stmt = $db->query("SELECT * FROM carro Where placa = '".$_GET['placa']."'");
$carro = $stmt->fetch();
$action = "alterar.php?id=".$carro["id"];
$placa = $carro['placa'];
$modelo = $carro['modelo'];
$cor = $carro['cor'];
$proprietario = $carro['proprietario'];
$telefone = $carro['telefone'];
  }
  ?>
 <div id="form">   

<form action= "<?php echo $action;?>"  method="POST" id="form">
  <label for="placa">Placa:</label><br>
  <input type="text" id="placa" name="placa" value= "<?php echo $placa;  ?>"> <br>
  <label for="modelo">Modelo:</label><br>
  <input type="text" id="modelo" name="modelo" value= "<?php echo $modelo; ?>"><br><br>
  <label for="cor">Cor:</label><br>
  <input type="text" id="cor" name="cor" value= "<?php echo $cor; ?>"><br><br>
  <label for="proprietario">Proprietário:</label><br>
  <input type="text" id="proprietario" name="proprietario" value= "<?php echo $proprietario; ?>"> <br><br>
  <label for="telefone">Telefone:</label><br>
  <input type="text" id="telefone" name="telefone" value= "<?php  echo $telefone;?> "><br><br>  
  
  <input type="submit" value="Submit">
  
</table>

</form>
<br/>

  <?php if(isset($_GET['response'])) {
   echo "<p>".$_GET['response']."</p>";
  }
      ?>
      </br>
</div>
</div>
</body>
</html>