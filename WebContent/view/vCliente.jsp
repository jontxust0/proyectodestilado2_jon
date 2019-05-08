<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cliente</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
    <nav>
        <div class="nav-wrapper teal lighten-1 z-depth-3">
          <a href="#!" class="brand-logo"><i class="material-icons">whatshot</i>DESTILA2</a>
          <ul class="right hide-on-med-and-down">
            <li><a href="#modalCarrito" class="modal-trigger"><i class="material-icons">shopping_cart</i></a></li>
            
          </ul>
        </div>
      </nav>




    <div class="row cuerpo">
      <div class="col s2 sidebar teal lighten-2">
        <div class="row">
            <a class="waves-effect waves-teal btn-flat categorias col s12 center-align" href="#categoria">categoria</a>
        </div>
      </div>
      
      
<!-- EJEMPLO PRODUCTO -->
      <div class="col s10 cuerpoProductos teal lighten-5">
         <a href="#modalProducto" class="modal-trigger">
            <div class="container">
                <div class="row">
                    <div class="col card-producto s3 teal lighten-2  z-depth-1">                        
                        <img class="responsive-img" src="img/licorFuegoVal.png"/>                        
                            <p class="center-align"><b>Nombre</b></p>                                            
                    </div>                     
                </div>
            </div>
          </a>
      </div>
      
      
<!-- MODAL CARRITO -->
<div id="modalCarrito" class="modal bottom-sheet">
    <div class="modal-content">
      <h4>Carrito</h4>
      <table class="responsive-table">
        <thead>
          <tr>
              <th>Cantidad</th>
              <th>Producto</th>
              <th>Precio</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>1</td>
            <td>nombre</td>
            <td>10$</td>
          </tr>
          <tr>
            <td>2</td>
            <td>nombre</td>
            <td>20$</td>
          </tr>
          <tr>
            <td>3</td>
            <td>nombre</td>
            <td>30$</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="modal-footer">
    	<div class="row">
    		<div class="col s6">
    			<p class="left-align"><b>Precio Total: 000$</b></p>
    		</div>
    		<div class="col s6">
      			<a href="CPago" class="modal-close waves-effect waves-green btn-flat">Comprar</a>
      		</div>
    	</div>
    </div>
  </div>
  
 <!-- MODAL PRODUCTO -->
<div id="modalProducto" class="modal modal-fixed-footer">
    <div class="modal-content">
      <h4>Nombre del producto</h4>
            <div class="container">
                <div class="row">
                    <div class="col s6">                        
                        <img class="responsive-img" src="img/licorFuegoVal.png"/>                                                                   
                    </div>   
                    <div class="col s6">     
                    	<h3>Descripcion</h3>                   
                        <p>lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum </p>                                                                   
                    </div>                    
                </div>
                <div class="row">
                    <div class="input-field col s6">                        
                        <input value="1" id="cantidadProducto" type="number" class="validate" min="1">
      					<label class="active" for="cantidadProducto">Cantidad</label>                                                                 
                    </div>   
                    <div class="col s6">     
                    	<h5>Precio Unidad</h5>                   
                        <h6><b>15$</b></h6>                                                                   
                    </div>                    
                </div>
            </div>
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-close waves-effect waves-green btn-flat">Agregar al carrito</a>
    </div>
  </div>


    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    
    <script>
        $(document).ready(function(){
         $('.modal').modal();        
        });
       </script>
</body>
</html>