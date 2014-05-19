
var subtotal = 0;
var idSeleccionado = "";
var InfoBebidas;
var Vendiendo = [];


function AgregarProducto(Tamagno) {

   parent.jQuery.colorbox.close();

	var producto = InfoBebidas[1];
	var precio = parseInt(InfoBebidas[Tamagno]);

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
         var md = this.DrinkPrice;
         var gd = this.DrinkPrice;

         $("#lista-productos").append(
   			'<li>'+
   			'<a class="th product" onclick="GuardarPrecios('+ id +','+ nombre +',' + ch + ','+ md + ',' + gd + ')">' +
   			'<img src="img/bebidas/' + imagen + '">' +
   			'<label>' + nombre + '</label>' +
   			'</a></li> ');

		});
		
		//DrinkID, DrinkName, DrinkPicture
      //parent.jQuery.colorbox.close();
   }

function GuardarPrecios(IdBebida, Nombre, Chico, Mediano, Grande)
{
   alert(IdBebida + ", " + Nombre + ", " + Chico + ", " + Mediano + ", " + Grande);
   InfoBebidas = [IdBebida, Nombre, Chico, Mediano, Grande];   
   alert(InfoBebidas);
}


function PostingPosts(){

   $.post( "test.php", { 'choices': Vendiendo.toString() } )
      .done(function( data ) {
         alert( "Data Loaded: " + data );
      });
   //$.post( "test.php", );
}
function AddingProducts(IdBebida, Nombre, Tamagno, Precio){   


   var Producto = {
      "IdBebida" : IdBebida, 
      "Nombre" : Nombre,
      "Tamagno" : Tamagno,
      "Precio" : Precio      
   };
   
   
   Vendiendo.push(Producto); 

      
   var mensaje = "";
   $(Vendiendo).each(function() {  
         var nombre = this.IdBebida;
         var id = this.Nombre;
         var imagen = this.Tamagno;
         var ch = this.Precio;

      mensaje = mensaje + "| " + nombre + ", " + id + ", " + imagen + ", " + ch;
   });
   alert(mensaje);
   
   
}
