
$(document).ready(function(){
    $('#modal').modal();

        
        $.getJSON("http://localhost:8080/Proyecto_destila2/ApiProductos").done(function (response){
        	console.log(response);
        	
        	var productos= response;
        	
        	var html = "";
        	
        	for (var index = 0; index < productos.length; index++) {
   				const producto= productos[index];
   				
   				  html += '<p>'
   				  html += '<label>'
   				  html += '<input class="with-gap" name="selected" type="radio" value="'+producto.id+'"/>'
   				  html += '<span>'+ producto.nombre +'</span>'
   				  html += '</label>'
   				  html += '</p>'
   			}
        	html += '<button type="submit" class="modal-close waves-effect waves-green btn-flat">Seleccionar</button>'
        		
        	$('#selectNombres').html(html);
        });
        
        $.getJSON("http://localhost:8080/Proyecto_destila2/ApiFacturas"
    	).done(function (response) {
    		console.log(response);
        	
    		var facturas = response; 
    	      var html = "";

     	      for (let index = 0; index < facturas.length; index++) {
    	        const factura = facturas[index];
    	         html += '<tr>'
    	    	 html += '<td><span>'+factura.id+'<span></td>'
    	    	 html += '<td><span>'+factura.comprador+'<span></td>'
    	    	 html += '<td><a href="CVerFacturas?id='+factura.id+'" class="waves-effect waves-light btn-large">Seleccionar</a></td>'
    	    	 html += '<td><a href="CBorrarFactura?id'+factura.id+'" class="waves-effect waves-light btn-large"><i class="material-icons">delete</i></a></td>'
    	    	 html += '</tr>'
    	      }
     	     
     	    	  
    	      $('#factura').html(html);
    	      
    	});
        
    });