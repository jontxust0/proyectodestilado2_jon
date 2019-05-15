<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Compiled and minified CSS -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css'>
    <link rel='stylesheet' href='css/main.css'>
    <title>Admin</title>
</head>
<body class="teal lighten-5">  
    <div class="container">
        <h1 class="col-12 center-align">Destila2</h1>
        <div class="row cuerpo">
<!-- Añadir Producto -->
                <div class="col s12 botones">
                    <a class="waves-effect waves-light btn-large modal-trigger col s12"  href="#modalAniadir" >Aniadir producto</a>
    
                    <div id="modalAniadir" class="modal">
                        <div class="modal-content">
                            <h4>Aniadir producto</h4>
                            <form action="CEjecutarAniadir">
       	 					<div class="row">
            					<div class="input-field col s12">
            					<input placeholder="Placeholder" name="nombre" id="nombre" type="text" class="validate">
            					<label for="nombre">Nombre </label>
            					</div>
        					</div>

        					<div class="row">
            					<div class="input-field col s12">
                    			<div id="categoria">

                    			</div>
                  				</div>
        					</div>

        					<div class="row">
            					<div class="input-field col s12">
            						<input placeholder="Placeholder" name="precio" id="precio" type="text" class="validate">
            						<label for="precio">Precio</label>
            					</div>
        					</div>

        					<div class="row">
            					<div class="input-field col s12">
            					<input placeholder="Placeholder" name="img" id="img" type="text" class="validate">
           	 					<label for="img">URL de la imagen</label>
            					</div>
        					</div>
        					<div class="row">
            					<div class="input-field col s12">
            					<input placeholder="Placeholder"	name="descripcion" id="descripcion" type="text" class="validate">
            					<label for="descripcion">Descripcion del producto</label>
            					</div>
        					</div>
        					<input type="submit" class="waves-effect waves-light btn-large modal-trigger col s12" value="Enviar"></input>
    						</form>

                        </div>
                        <div class="modal-footer">
                            <a href="#!" class="modal-close waves-effect waves-green btn-flat" >Cerrar</a>
                        </div>
                        </div>
                </div>

<!-- Editar producto -->
                <div class="col s12 botones">
                    <a class="waves-effect waves-light btn-large modal-trigger col s12" href="#modalEditar">Editar producto</a>

                    <div id="modalEditar" class="modal">
                            <div class="modal-content">
                                <h4>Seleccionar el  producto</h4>
							<div class="row">
            					<div class="input-field col s12">
                    			<form action="CEditar" id="selectNombres">
								
								</form>
								</div>
                  			</div>

                            <div class="modal-footer">
                            </div>
                    </div>
                </div>
                </div>
 
 <!-- Borrar producto -->               
                <div class="col s12 botones">
                    <a class="waves-effect waves-light btn-large modal-trigger col s12" href="#modalBorrar">Borrar producto</a>

                    <div id="modalBorrar" class="modal">
                            <div class="modal-content">
                                <h4>Borrar producto</h4>


                            </div>
                            <div class="modal-footer">
                                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Close</a>
                            </div>
                            </div>
                        </div>

<!-- Facturas -->
                <div class="col s12 botones">
                    <a class="waves-effect waves-light btn-large modal-trigger col s12" href="#modalFactura">Facturas</a>

                    <div id="modalFactura" class="modal">
                            <div class="modal-content">
                                <h4>Facturas</h4>
                                <div class="row">
            						<div class="input-field col s12">
									<form action="vFacturas" >
										<table>
        									<thead>
          										<tr>
              										<th>Id</th>
              										<th>Comprador</th>
              										<th>Seleccionar</th>
          										</tr>
          									</thead>	
          									<tbody id="factura">	

											</tbody>
      									</table>
                            		</form>
                            		</div>
                            	</div>

                            </div>
                            <div class="modal-footer">
                                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Close</a>
                            </div>
                            </div>
                        </div>
            
                <div class="col-12 botones">

                        <a href="view/vIndex.html" class="waves-effect waves-light btn-large modal-trigger col s12">Cambiar de usuario</a>
                </div>
        </div>
    </div>
    <div id="prueba">
    
    </div>
</body>
<!-- Compiled and minified JavaScript -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js'></script>  
<script src="js/adminJavascript.js"></script>

<script>
$('.modal').modal();
$('select').formSelect();
</script>
</html>