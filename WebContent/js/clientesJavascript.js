$(document).ready(function(){

    $.getJSON("http://localhost:8080/Proyecto_destilado2/CCategoria"
    		).done(function (response) {
        console.log(response);
        var categorias = response;        
        
          var html = "";
          for (let index = 0; index < categorias.length; index++) {
            const categoria = categorias[index];
            html += '<div class="row">'
            html +=	'<a class="waves-effect waves-teal btn-flat categorias col s12 center-align" href="#'+categoria.nombre+'" value="'+categoria.id+'">'+categoria.nombre+'</a>'
            html += '</div>'
          }

          $('.rellenarCategorias').html(html);
        

          
      });
	
	
    $.getJSON("http://localhost:8080/Proyecto_destilado2/CProductos"
	).done(function (response) {
		console.log(response);
		var productos = response;        

		var html = "";
		for (let index = 0; index < productos.length; index++) {
			const producto = productos[index];
			html +=	'<div class="col s3">'
			html +=	'<a href="#modalProducto" class="modal-trigger modalProducto" data-id="' + producto.id + '">'
			html +=	'<div class="container">'
			html +=	'<div class="row">'
			html +=	'<div class="teal lighten-2 card-producto z-depth-1">'
			html +=	'<img class="responsive-img circle" src="../'+producto.img+'"/>'
			html +=	'<p class="center-align"><b>'+producto.nombre+'</b></p>'
			html +=	'</div>'
			html +=	'</div>'
			html +=	'</div>'
			html +=	'</a>'
			html +=	'</div>' 
			
  }

  $('.cuerpoProductos').html(html);

  
  
  
  $(".modalProducto").on("click", function () {
      var producto_id = $(this).data('id');
      var img = "";


      for (let modal = 0; modal < productos.length; modal++) {
        const producto = productos[modal];
        if (producto.id == producto_id) {
          $('.productoTitulo').html(producto.nombre);
          
          $('.productoDescripcion').html(producto.descripcion);

          $('.productoPrecio').html(producto.precio);
          
          img += '<img class="responsive-img" src="../'+producto.img+'"/>' 
          
          
          $('.productoImg').html(img);
        }
        
      }


    });

  
});
	
});