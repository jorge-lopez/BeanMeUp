
var subtotal = 0;
var idSeleccionado = "";
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
}



   function AgregarProductoHTML(drinks) {

   		$(jQuery.parseJSON(drinks)).each(function() {  
         var nombre = this.DrinkName;
         var id = this.DrinkID;
         var imagen = this.DrinkPicture;
         var ch = this.DrinkPrice;
         var ch = this.DrinkPrice;
         var ch = this.DrinkPrice;

         $("#lista-productos").append(
   			'<li>'+
   			'<a id="' + id + '" class="th product" onclick="AgregarProducto(this)">' +
   			'<img src="../img/bebidas/' + imagen + '">' +
   			'<label>' + nombre + '</label>' +
   			'<input id="chico" type="hidden" value="40" class="precio" />' +
            '<input id="mediano" type="hidden" value="40" class="precio" />' +
            '<input id="grande" type="hidden" value="40" class="precio" />' +
   			'</a></li> ');

		});
		
		//DrinkID, DrinkName, DrinkPicture
   }
