<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Pago</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
    <nav>
        <div class="nav-wrapper teal lighten-1 z-depth-3">
          <a href="#!" class="brand-logo"><i class="material-icons">whatshot</i>DESTILA2</a>
          <a class="brand-logo center">PAGO</a>
        </div>
      </nav>

    <div class="row">
    	<br>
    	<br>
    	<br>
    	<br>
    		<div class="container">
    			<div class="col s12">
      				<div class="row">
        				<div class="input-field col s12">
          				<input placeholder="Nombre Apellido" id="comprador" name="comprador" type="text" class="validate">
          				<label for="comprador">Nombre y Apellidos</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input placeholder="Direccion" id="direccion" name="direccion" type="text" class="validate">
          <label for="direccion">Direccion</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input placeholder="Telefono" id="telefono" type="tel" class="validate" name="telefono">
          <label for="telefono">Telefono</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input placeholder="DNI" id="dni" type="text" class="validate" name="dni">
          <label for="dni">DNI</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input placeholder="Tarjeta De Credito" id="tarjetaCredito" type="text" class="validate">
          <label for="tarjetaCredito">Tarjeta de Credito</label>
        </div>
      </div>
      <div class="row">
        <button type="button" id="botonPagar" class="col s6 waves-effect waves-green btn-flat">Pagar</button>
        <a href="view/vCliente.html" class="col s6 waves-effect waves-green btn-flat">Volver</a>
      </div>

    </div>
    </div>  

    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
    <script>
        $(document).ready(function(){
      //   $('.modal').modal();     
         
         $('#botonPagar').on("click", function(){
        	 alert("Pago Realizado");
        	 
        	 var carrito=localStorage.getItem("carrito");
        	 var comprador = document.getElementById("comprador");
        	 var direccion = document.getElementById("direccion");
        	 var telefono = document.getElementById("telefono");
        	 var dni = document.getElementById("dni");
        	 
        	 $.ajax({
        		 type:"POST",
        		 data:{
        			 'carrito':carrito,
        			// 'comprador':comprador,
        			 //'direccion':direccion,
        			 //'telefono':telefono,
        			// 'dni':dni,	 
        		 	  },
        		datatype:'json',
        	 	url:'CCrearFactura',
        	 	success: function(result){
        	 		alert('bien');
        	 	},
        	 	error: function(xhr){
        	 		alert('An error occured:'+ xhr.status);
        	 	}
        	 	}); 
         	});
        });
       </script>
</body>
</html>