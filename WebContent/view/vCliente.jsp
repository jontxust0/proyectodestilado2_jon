<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
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

      <div class="col s10 cuerpoProductos teal lighten-5">
            <div class="container">
                <div class="row">
                    <div class="col card-producto s3 teal lighten-2  z-depth-1">
                        
                        <img class="responsive-img" src="img/licorFuegoVal.png"/>
                        
                            <p class="center-align"><b>Nombre</b></p>
                        
                        
                    </div> 
                    
                </div>
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