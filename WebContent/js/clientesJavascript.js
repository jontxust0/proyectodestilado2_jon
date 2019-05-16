/**
 * 
 * @returns
 */

$(document).ready(function () {

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

            html_categoria += '<div class="col s6 m3 l3 cardProducto">'
            html_categoria += '<a href="#modalProducto" class="modal-trigger cardProducto" data-id="' + producto.id + '">'
            html_categoria += '<div class="container">'
            html_categoria += '<div class="row">'
            html_categoria += '<div class="teal lighten-2 cardProducto z-depth-1">'
            html_categoria += '<img class="responsive-img circle" src="../' + producto.img + '"/>'
            html_categoria += '<p class="center-align"><b>' + producto.nombre + '</b></p>'
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
    $(".verCarrito").on("click", function () {

    });// click verCarrito
    //Añade productos al carrito
    var precioTot = 0;
    
    
    $(".botonAddCarrito").on("click", function () {

      var idProd = $(".imgModalProducto").data('id');
      var cantidadProd = $("#cantidadProducto").val();
      
      

      //Llama a la Api CProductos

      $.getJSON("http://localhost:8080/Proyecto_destila2/ApiProductos"
      ).done(function (response) {

        var productos = response;
        var html_carrito = "";
        var html_precio = "";
        
        var vCarrito=JSON.parse(localStorage.getItem("carrito"));
        
        if ( vCarrito==null){
        	vCarrito=[];
        }

        //Recorre el api y añade lineas al array

        for (let modal = 0; modal < productos.length; modal++) {
          const producto = productos[modal];
          if (producto.id == idProd) {
        	  
            var precioMult = producto.precio * cantidadProd;

            html_carrito += '<tr>'
            html_carrito += '<td>' + cantidadProd + '</td>'
            html_carrito += '<td>' + producto.nombre + '</td>'
            html_carrito += '<td>' + precioMult + '</td>'
            html_carrito += '<td><a href="#" data-precio=' + precioMult + ' class="borrarItemCarrito"><i class="material-icons">clear</i></a></td>'
            html_carrito += '</tr>'
            var compra={
            		nombre:producto.nombre,
            		cantidad:cantidadProd,
            		precio:producto.precio	
            }
            vCarrito.push(compra);

            precioTot = precioTot + precioMult
            
            html_precio += '<b class="precioCarr" value="'+precioTot+'">'+precioTot+'</b>'

            $('.tablaCarrito').append(html_carrito);
            $('.precioTotalCarrito').html(html_precio);
          }
        } 
        vCarrito= localStorage.setItem( "carrito", JSON.stringify ( vCarrito));

      });
    });

    //Borrar items del carrito
    var precioTotalActual = 0;
    $(document).on('click', '.borrarItemCarrito', function (e) {

      precioTotalActual = $(".precioCarr").text();
      var precioItem = $(this).data('precio');
      var html_precio = "";
      
      $(this).parent().parent().remove();

      precioTot = precioTotalActual - precioItem 

      html_precio += '<b class="precioCarr" value="'+precioTot+'">'+precioTot+'</b>'
      
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