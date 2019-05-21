/**
 * 
 * @returns
 */

$(document).ready(function () {
	
	 
	 $(".carVacio").hide();
  //Llama a la Api CProductos

  $.getJSON("http://localhost:8080/Proyecto_destila2/ApiProductos"
  ).done(function (response) {

    console.log(response);

    var productos = response;
    var html = "";

    //Recorre el api y añade las lineas a la variable(array) html

    for (let index = 0; index < productos.length; index++) {
      const producto = productos[index];
      html += '<div class="col s6 m3 l3">'
      html += '<a href="#modalProducto" class="modal-trigger cardProducto" data-id="' + producto.id + '">'
      html += '<div class="container">'
      html += '<div class="row">'
      html += '<div class="teal lighten-2 card-producto z-depth-1">'
      html += '<img class="img circle" width="100%" height="100%" src="../' + producto.img + '"/>'
      html += '<p class="center-align"><b>' + producto.nombre + '</b></p>'
      html += '<a class="waves-effect waves-light btn teal col s12 botonAniadirCarritoCard" data-id="' + producto.id + '">Añadir al carrito</a>'
      html += '</div>'
      html += '</div>'
      html += '</div>'
      html += '</a>'
      html += '</div>'
    }

    //Inserta los datos del array al html

    $('.cuerpoProductos').html(html);

    aniadirEventoClickModalProducto();

    //Llama a la Api CCategoria

    $.getJSON("http://localhost:8080/Proyecto_destila2/ApiCategorias"
    ).done(function (response) {

      console.log(response);
      var categorias = response;
      var html = "";

      //Recorre el Api y añade las lineas al array html

      for (let index = 0; index < categorias.length; index++) {
        const categoria = categorias[index];
        html += '<div class="row">'
        html += '<a class="waves-effect waves-teal btn-flat categorias col s12 center-align" href="#' + categoria.nombre + '" data-id="' + categoria.id + '">' + categoria.nombre + '</a>'
        html += '</div>'
      }

      //Inserta los datos del array al html

      $('.rellenarCategorias').html(html);

      $(".categorias").on("click", function () {
        var categoria_id = $(this).data('id');
        var html_categoria = "";


        //Carga los productos de una categoria
        for (let cat = 0; cat < productos.length; cat++) {
          const producto = productos[cat];

          //si las ids de categoria coinciden añade lineas al array

          if (categoria_id == producto.id_categoria) {

        	  html_categoria += '<div class="col s6 m3 l3">'
        	  html_categoria += '<a href="#modalProducto" class="modal-trigger cardProducto" data-id="' + producto.id + '">'
        	  html_categoria += '<div class="container">'
        	  html_categoria += '<div class="row">'
        	  html_categoria += '<div class="teal lighten-2 card-producto z-depth-1">'
        	  html_categoria += '<img class="img circle" width="100%" height="100%" src="../' + producto.img + '"/>'
        	  html_categoria += '<p class="center-align"><b>' + producto.nombre + '</b></p>'
        	  html_categoria += '<a class="waves-effect waves-light btn teal col s12 botonAniadirCarritoCard" data-id="' + producto.id + '">Añadir al carrito</a>'
        	  html_categoria += '</div>'
        	  html_categoria += '</div>'
        	  html_categoria += '</div>'
        	  html_categoria += '</a>'
        	  html_categoria += '</div>'

            //Inserta el array en el html

            $('.cuerpoProductos').html(html_categoria);

            aniadirEventoClickModalProducto();
          }
        }
      });
    });
    //ver los productos del carrito
    $("#verCarrito").on("click", function () {
    	
    	var html = "";
    	var precioTot = 0;
    	var vCarrito = JSON.parse(localStorage.getItem("carrito"));
    	
    	if (vCarrito == null) {
    		$(".carVacio").show();
            $(".tablaCarrito").hide();
            $(".precioCar").hide();
            $(".botonComprarCar").hide();
        }else {
        	$(".carVacio").hide();
            $(".tablaCarrito").show();
            $(".precioCar").show();
            $(".botonComprarCar").show();
            
            
            for (let index = 0; index < vCarrito.length; index++) {
            	
            	var precioMult = vCarrito[index].precio * vCarrito[index].cantidad;
            	var html_precio = "";
            	
            	
            	html += '<tr>'
                html += '<td>' + vCarrito[index].cantidad + '</td>'
                html += '<td><a href="#" class="botonPlus" data-id="'+vCarrito[index].id+'"><i class="material-icons">add_circle</i></a><a href="#" class="botonMinus" data-id="'+vCarrito[index].id+'"><i class="material-icons">do_not_disturb_on</i></a></td>'
            	html += '<td>' + vCarrito[index].nombre + '</td>'
            	html += '<td>' + precioMult + '</td>'
            	html += '<td><a href="#" data-id=' + vCarrito[index].id + ' class="borrarItemCarrito"><i class="material-icons">clear</i></a></td>'
            	html += '</tr>'
            	
            	precioTot = parseFloat(precioTot)+parseFloat(precioMult);
            	
            	html_precio += '<p>'+precioTot+'</p>'
            	

            	
            	$('.tablaCarrito').html(html);
            	$('.precioTotalCarrito').html(html_precio);
            }
        }
    	
    	
    	
    });// click verCarrito
    //Añade productos al carrito
    var precioTot = 0;
    
    
    $(".botonAddCarrito").on("click", function () {

      var idProd = $(".imgModalProducto").data('id');
      var cantidadProd = $("#cantidadProducto").val();
      var cantidadaux = 0;
      

  

      //Llama a la Api CProductos

      $.getJSON("http://localhost:8080/Proyecto_destila2/ApiProductos"
      ).done(function (response) {
      	  var productos = response;
           
            
      	var vCarrito = JSON.parse(localStorage.getItem("carrito")); //de string a array JSON
          var encontrado = false;
          if (vCarrito == null) {
              vCarrito = [];
          }
          else {
              for (let index = 0; index < vCarrito.length; index++) {

                  if (vCarrito[index].id == idProd) {
                	  cantidadaux = vCarrito[index].cantidad;
                      var sumaCantidades = parseInt(cantidadProd) + parseInt(cantidadaux);
                      vCarrito[index].cantidad= sumaCantidades;
                      encontrado = true;
                  }
              }
          }
          if (encontrado == false) {
          	
          	for (let modal = 0; modal < productos.length; modal++) {
                  const producto = productos[modal];
                  if (producto.id == idProd) {
                	  
//                    var precioMult = producto.precio * cantidad;
//
//                    html_carrito += '<tr>'
//                    html_carrito += '<td>' + cantidad + '</td>'
//                    html_carrito += '<td>' + producto.nombre + '</td>'
//                    html_carrito += '<td>' + precioMult + '</td>'
//                    html_carrito += '<td><a href="#" data-precio=' + precioMult + ' class="borrarItemCarrito"><i class="material-icons">clear</i></a></td>'
//                    html_carrito += '</tr>'
//                    
//
//                    precioTot = precioTot + precioMult
//                    
//                    html_precio += '<b class="precioCarr" value="'+precioTot+'">'+precioTot+'</b>'
//                    $('.tablaCarrito').append(html_carrito);
//                    $('.precioTotalCarrito').html(html_precio);
                	var compra={
                    		id:producto.id,
                    		nombre:producto.nombre,
                    		cantidad:cantidadProd,
                    		precio:producto.precio	
                    }
                    
                    
                  }
                } 
          	vCarrito.push(compra);
              
          }
      	
          localStorage.setItem("carrito", JSON.stringify(vCarrito));
          

      });
    });
    
    //añade productos al carrito desde el card

    $(document).on('click', '.botonAniadirCarritoCard', function (e) {
   
    	var cantidadProd = 1;

        var idProd = $(this).data('id');

        //Llama a la Api CProductos

        $.getJSON("http://localhost:8080/Proyecto_destila2/ApiProductos"
        ).done(function (response) {
        	  var productos = response;     
        
              
        	var vCarrito = JSON.parse(localStorage.getItem("carrito")); //de string a array JSON
            var encontrado = false;
            if (vCarrito == null) {
                vCarrito = [];
            }
            else {
                for (let index = 0; index < vCarrito.length; index++) {

                    if (vCarrito[index].id == idProd) {
                        vCarrito[index].cantidad++;
                        encontrado = true;
                    }
                }
            }
            if (encontrado == false) {
            	
            	for (let modal = 0; modal < productos.length; modal++) {
                    const producto = productos[modal];
                    if (producto.id == idProd) {
                  	  
//                      var precioMult = producto.precio * cantidad;
//
//                      html_carrito += '<tr>'
//                      html_carrito += '<td>' + cantidad + '</td>'
//                      html_carrito += '<td>' + producto.nombre + '</td>'
//                      html_carrito += '<td>' + precioMult + '</td>'
//                      html_carrito += '<td><a href="#" data-precio=' + precioMult + ' class="borrarItemCarrito"><i class="material-icons">clear</i></a></td>'
//                      html_carrito += '</tr>'
//                      
//
//                      precioTot = precioTot + precioMult
//                      
//                      html_precio += '<b class="precioCarr" value="'+precioTot+'">'+precioTot+'</b>'
//                      $('.tablaCarrito').append(html_carrito);
//                      $('.precioTotalCarrito').html(html_precio);
                  	var compra={
                      		id:producto.id,
                      		nombre:producto.nombre,
                      		cantidad:cantidadProd,
                      		precio:producto.precio	
                      }
                      
                      
                    }
                  } 
            	vCarrito.push(compra);
                
            }
        	
            localStorage.setItem("carrito", JSON.stringify(vCarrito));
          
         

        });
      });
    
    //sumar uno al la cantidad
    $(document).on('click', '.botonPlus', function (e) {
    	var html_precio = "";
    	var html = "";

        var idProd = $(this).data('id');

        //Llama a la Api CProductos

        $.getJSON("http://localhost:8080/Proyecto_destila2/ApiProductos"
        ).done(function (response) {
        	  var productos = response;     
        
              
        	var vCarrito = JSON.parse(localStorage.getItem("carrito")); //de string a array JSON
            var encontrado = false;
            if (vCarrito == null) {
                vCarrito = [];
            }
            else {
                for (let index = 0; index < vCarrito.length; index++) {

                    if (vCarrito[index].id == idProd) {
                        vCarrito[index].cantidad++;
                        encontrado = true;
                    }
                }
            }

        	
            localStorage.setItem("carrito", JSON.stringify(vCarrito));
          
          	$(".tablaCarrito").children().remove();
        	$(".precioTotalCarrito").children().remove();
         

            for (let index = 0; index < vCarrito.length; index++) {
            	
            	var precioMult = vCarrito[index].precio * vCarrito[index].cantidad;
            	
            	
            	
            	html += '<tr>'
                html += '<td>' + vCarrito[index].cantidad + '</td>'
                html += '<td><a href="#" class="botonPlus" data-id="'+vCarrito[index].id+'"><i class="material-icons">add_circle</i></a><a href="#" class="botonMinus" data-id="'+vCarrito[index].id+'"><i class="material-icons">do_not_disturb_on</i></a></td>'
            	html += '<td>' + vCarrito[index].nombre + '</td>'
            	html += '<td>' + precioMult + '</td>'
            	html += '<td><a href="#" data-id=' + vCarrito[index].id + ' class="borrarItemCarrito"><i class="material-icons">clear</i></a></td>'
            	html += '</tr>'
            	
            	precioTot = parseFloat(precioTot)+parseFloat(precioMult);
            	
            	
            	

            	
            	
            	
            	
            }
            html_precio += '<p>'+precioTot+'</p>'
            $('.tablaCarrito').html(html);
            $('.precioTotalCarrito').html(html_precio);

        });
      });
    
    //restar uno al la cantidad
    $(document).on('click', '.botonMinus', function (e) {
    	var html_precio = "";
    	var html = "";

    	var idProd = $(this).data('id');

        //Llama a la Api CProductos

        $.getJSON("http://localhost:8080/Proyecto_destila2/ApiProductos"
        ).done(function (response) {
        	  var productos = response;     
        
              
        	var vCarrito = JSON.parse(localStorage.getItem("carrito")); //de string a array JSON
            
            if (vCarrito == null) {
                vCarrito = [];
            }
            else {
                for (let index = 0; index < vCarrito.length; index++) {

                    if (vCarrito[index].id == idProd) {
                    	if (vCarrito[index].cantidad <= 1) {
                    		
                    		alert("No se pueden quitar mas productos");
						} else {
							vCarrito[index].cantidad--;
	                        
						}
                    	
                        
                    }
                }
            }

        	
            localStorage.setItem("carrito", JSON.stringify(vCarrito));
          
          	$(".tablaCarrito").children().remove();
        	$(".precioTotalCarrito").children().remove();
         

            for (let index = 0; index < vCarrito.length; index++) {
            	
            	var precioMult = vCarrito[index].precio * vCarrito[index].cantidad;
            	
            	
            	
            	html += '<tr>'
                html += '<td>' + vCarrito[index].cantidad + '</td>'
                html += '<td><a href="#" class="botonPlus" data-id="'+vCarrito[index].id+'"><i class="material-icons">add_circle</i></a><a href="#" class="botonMinus" data-id="'+vCarrito[index].id+'"><i class="material-icons">do_not_disturb_on</i></a></td>'
            	html += '<td>' + vCarrito[index].nombre + '</td>'
            	html += '<td>' + precioMult + '</td>'
            	html += '<td><a href="#" data-id=' + vCarrito[index].id + ' class="borrarItemCarrito"><i class="material-icons">clear</i></a></td>'
            	html += '</tr>'
            	
            	precioTot = parseFloat(precioTot)+parseFloat(precioMult);
            	
            	
            	

            	
            	
            	
            	
            }
            html_precio += '<p>'+precioTot+'</p>'
            $('.tablaCarrito').html(html);
            $('.precioTotalCarrito').html(html_precio);

        });
      });
    

    //Borrar items del carrito
    
    $(document).on('click', '.borrarItemCarrito', function (e) {
    	var idProd = $(this).data('id');
    	var html = "";
    	var indiceAux = -1;
    	var html_precio = "";
    	var precioTot = 0;
    	var vCarrito = JSON.parse(localStorage.getItem("carrito"));
    	
    	
    	 //llenar carrito Modificado con los datos del antiguo
    	for (let index = 0; index < vCarrito.length; index++) {    
    		if (vCarrito[index].id == idProd) {
    			indiceAux = index;
    		}	
    	}
    	vCarrito.splice(indiceAux, 1);
    	
    	
    	localStorage.setItem("carrito", JSON.stringify(vCarrito));
    	
    	
    	// refrescar el modal recorriendo el carrito
    	$(".tablaCarrito").children().remove();
    	$(".precioTotalCarrito").children().remove();
     

        for (let index = 0; index < vCarrito.length; index++) {
        	
        	var precioMult = vCarrito[index].precio * vCarrito[index].cantidad;
        	
        	
        	
        	html += '<tr>'
            html += '<td>' + vCarrito[index].cantidad + '</td>'
            html += '<td><a href="#" class="botonPlus" data-id="'+vCarrito[index].id+'"><i class="material-icons">add_circle</i></a><a href="#" class="botonMinus" data-id="'+vCarrito[index].id+'"><i class="material-icons">do_not_disturb_on</i></a></td>'
        	html += '<td>' + vCarrito[index].nombre + '</td>'
        	html += '<td>' + precioMult + '</td>'
        	html += '<td><a href="#" data-id=' + vCarrito[index].id + ' class="borrarItemCarrito"><i class="material-icons">clear</i></a></td>'
        	html += '</tr>'
        	
        	precioTot = parseFloat(precioTot)+parseFloat(precioMult);
        	
        	
        	

        	
        	
        	
        	
        }
        html_precio += '<p>'+precioTot+'</p>'
        $('.tablaCarrito').html(html);
        $('.precioTotalCarrito').html(html_precio);
       
     
    });
  });

  //Funcion rellenar modal

  function aniadirEventoClickModalProducto() {

    //click en el card rellena el modal

    $(".cardProducto").on("click", function () {

      var producto_id = 0;
      producto_id = $(this).data('id');
      var img = "";
      var boton = "";
      var cantidad = "";

      //Llama a la api

      $.getJSON("http://localhost:8080/Proyecto_destila2/ApiProductos"
      ).done(function (response) {

        var productos = response;

        //recorre la api y carga los datos en el modal

        for (let modal = 0; modal < productos.length; modal++) {
          const producto = productos[modal];
          if (producto.id == producto_id) {
            $('.productoTitulo').html(producto.nombre);

            $('.productoDescripcion').html(producto.descripcion);

            $('.productoPrecio').html(producto.precio);

            img += '<img class="responsive-img imgModalProducto" data-id="' + producto.id + '" src="../' + producto.img + '"/>'

            $('.productoImg').html(img);

            cantidad += '<input value="1" id="cantidadProducto" type="number" class="validate" min="1">'
            cantidad += '<label class="active" for="cantidadProducto">Cantidad</label>'

            $('.cantidadProducto').html(cantidad);

          }
        }
      }); // ajax apiproductos
    }); //click cardProducto
  }; // function aniadirEventoClickModalProducto
  
  
});//ready