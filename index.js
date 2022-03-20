function exclusao(id) {
      
    var msg = confirm("Atenção: Deseja Excluir esse Registro?");

    if (msg){
       
        window.location.href = "excluir.php?id=" + id;

    }
    else{
        alert("Operação Cancelada, o Registro não será Excluído!");


    }
}