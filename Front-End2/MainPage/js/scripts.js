
var subtotal = 0;
var idSeleccionado = "";
$("a.product").colorbox({href:"test.html"});

function AgregarProducto(padre) {


	var producto = $(padre).children("label").text();
	var precio = parseInt($(padre).children("input").val());

	$("#venta").append( producto + "  $" + precio + "<br>" );	

	subtotal = subtotal + precio;
	var iva = (subtotal * .16).toFixed(2);
	var total = (subtotal * 1.16).toFixed(2);
	
	document.getElementById("total").innerHTML = "SubTotal: " + subtotal + " <br>" + 
							"Iva: " + iva + " <br>" + 
							"Total: " + total;
							
    //
}



   function AgregarProductoHTML(drinks) {

   		$(jQuery.parseJSON(drinks)).each(function() {  
         var nombre = this.DrinkName;
         var id = this.DrinkID;
         var imagen = this.DrinkPicture;
         

         $("#lista-productos").append(
   			'<li>'+
   			'<a id="' + id + '" class="th product" onclick="AgregarProducto(this)">' +
   			'<img src="../img/bebidas/' + imagen + '">' +
   			'<label>' + nombre + '</label>' +
   			'<input type="hidden" value="40" class="precio" />' +
   			'</a></li> ');

		});
		
		//DrinkID, DrinkName, DrinkPicture
   }
   function AgregarFoto() {
   		
   		
   		$("#lista-productos").append(
   			'<li><a class="th product" onclick="AgregarProducto(this)">' +
   			'<img src="../img/bebidas/HazelnutMacchiato.jpg">' +
   			'<label>Hazelnut Macchiato</label>' +
   			'<input type="hidden" value="40" class="precio" />' +
   			'</a></li> ');
   }