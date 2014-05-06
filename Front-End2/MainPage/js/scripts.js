
var subtotal = 0;

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