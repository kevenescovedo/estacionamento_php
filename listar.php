<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carros no Estacionamento</title>
</head>
<body>
<a href="index.php">Inserir Carros</a>
</br>
<div id="table">
    
      <table border="1" id="table" span="26">
    <tr>

        <th colspan='2'>Placa</th>
        <th colspan='3'>Modelo</th>
        <th colspan='3'>Cor</th>
        <th colspan='5'>Propriétario</th>
        <th colspan='2'>Telefone</th>
        <th colspan='6'>Ações</th>
    </tr>
    <?php 
    require_once("db.php");
    $stmt = $db->query("Select * FROM carro");
    while($row = $stmt->fetch()) {
         echo "<tr>".
         "<td colspan='2'>".$row['placa']."</td>
         <td colspan='3'>".$row['modelo']."</td>
         <td colspan='3'>".$row['cor']."</td>
        <td colspan='5'>".$row['proprietario']."</td>
         <td colspan='3'>".$row['telefone']."</td>
         <td colspan='2'> <a href='index.php?placa=".$row["placa"]."'>Alterar</a>&nbsp;<button onclick='exclusao(".$row['id'].")'>Excluir</button></td>
         </tr>";
    }
    ?>

</table>
</div>

<script>
    function exclusao(id) {
      
        var msg = confirm("Atenção: Deseja Excluir esse Registro?");
    
        if (msg){
           
            window.location.href = "excluir.php?id=" + id;
    
        }
        else{
            alert("Operação Cancelada, o Registro não será Excluído!");
    
    
        }
    }
    
    </script>
</body>
</html>