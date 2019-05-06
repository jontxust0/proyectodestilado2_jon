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
<body>  
    <div class="container">
        <h1 class="col-12 center-align">Destila2</h1>
        <div class="row cuerpo">

                <div class="col s12 botones">
                    <a class="waves-effect waves-light btn-large modal-trigger col s12"  href="#modalAñadir" >Añadir producto</a>
    
                    <div id="modalAñadir" class="modal">
                        <div class="modal-content">
                            <h4>Añadir producto</h4>


                        </div>
                        <div class="modal-footer">
                            <a href="#!" class="modal-close waves-effect waves-green btn-flat">Agree</a>
                        </div>
                        </div>
                </div>


                <div class="col s12 botones">
                    <a class="waves-effect waves-light btn-large modal-trigger col s12" href="#modalEditar">Editar producto</a>

                    <div id="modalEditar" class="modal">
                            <div class="modal-content">
                                <h4>Editar producto</h4>


                            </div>
                            <div class="modal-footer">
                                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Agree</a>
                            </div>
                    </div>
                </div>
                
                <div class="col s12 botones">
                    <a class="waves-effect waves-light btn-large modal-trigger col s12" href="#modalBorrar">Borrar producto</a>

                    <div id="modalBorrar" class="modal">
                            <div class="modal-content">
                                <h4>Borrar producto</h4>


                            </div>
                            <div class="modal-footer">
                                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Agree</a>
                            </div>
                            </div>
                        </div>

                <div class="col s12 botones">
                    <a class="waves-effect waves-light btn-large modal-trigger col s12" href="#modalFactura">Facturas</a>

                    <div id="modalFactura" class="modal">
                            <div class="modal-content">
                                <h4>Facturas</h4>


                            </div>
                            <div class="modal-footer">
                                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Agree</a>
                            </div>
                            </div>
                        </div>
            
                <div class="col-12 botones">
                        <a href="vIndex.jsp" class="waves-effect waves-light btn-large modal-trigger col s12">Cambiar de usuario</a>
                </div>
        
        </div>
    </div>
</body>
<!-- Compiled and minified JavaScript -->
<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js'></script>  
<script src="js/javascript.js"></script>
<script>
    $(document).ready(function(){
        $('.modal').modal();
    });
</script>
</html>