
var subtotal = 0;
var InfoBebidas;
var Vendiendo = new Object();
var IdVenta = 0;

function AgregarProductoHTML(drinks) {

   $(jQuery.parseJSON(drinks)).each(function() {  
      var nombre = this.ProductName;
      var id = this.ProductID;
      var imagen = this.ProductPicture;

      $("#lista-productos").append(
         '<li>'+
         '<a class="th product" onclick="GuardarProductoEnMemoria('+ id +",'"+ nombre +'\')">' +
         '<img src="../../img/bebidas/' + imagen + '">' +
         '<label>' + nombre + '</label>' +
         '</a></li> ');
   });
   
   $("a.product").colorbox({
      href:"tamagnos.html", onLoad: function() {
         $('#cboxClose').remove();
      }
   });  
}

function GuardarProductoEnMemoria(IdBebida, Nombre)
{
   InfoBebidas = [IdBebida, Nombre];      
}

function ObtenerPrecio(IndexTamagno, StringTamagno) {

   parent.jQuery.colorbox.close();
	var producto = InfoBebidas[1] + " " + StringTamagno;   
   var precio;
   var jqXHR = $.ajax({
         type: "POST",
         url: "php/ObtenerPrecio.php",
         data: {IdProducto : InfoBebidas[0]}, 
         success: function(data) { 
            var tempArray = jQuery.parseJSON(data);
            precio = parseInt(tempArray[IndexTamagno].Price);
         }
      });
   jqXHR.done(function () {

   // AddingProductsToTicket(IdProducto, Nombre, IdTamagno, StringTamagno, Precio)
      AgnadirACarrito(InfoBebidas[0], InfoBebidas[1], IndexTamagno + 1, StringTamagno, precio);
   });
}


function AgnadirACarrito(IdProducto, Nombre, IdSize, StringTamagno, Precio){   

   if(isNaN(Vendiendo[IdProducto + '-' + IdSize]))
      Vendiendo[IdProducto + '-' + IdSize] = 0;
   Vendiendo[IdProducto + '-' + IdSize]++;

   var cantidad = Vendiendo[IdProducto + '-' + IdSize];
   var identificador = IdProducto + '-' + IdSize;

   if(cantidad == 1){
         $("#lista-articulos").append("<li><a class='small button secondary expand'>" + 
            "<span id='" + identificador + "' class='nombre left'>" + Nombre + " " + StringTamagno + "</span>" +
            "<span id='" + identificador + "' class='cantidad text-center'>" + "</span>" +
            "<span id='" + identificador + "' class='precio right'>$" + FormatearNumeros(Precio) + "</span></a></li>" ); 
               
   }
   else if(cantidad > 1){
      $("span#" + identificador + ".cantidad").html("x" + cantidad);
      $("span#" + identificador + ".precio").html("$" + (Precio * cantidad));
   }  
   


   subtotal = FormatearNumeros(subtotal + Precio);
   var iva = FormatearNumeros(subtotal * .16);
   var total = FormatearNumeros(subtotal * 1.16);

   $("span#subtotal").html("$" + subtotal);
   $("span#iva").html("$" + iva);
   $("span#total").html("$" + total);
}
function FormatearNumeros(Numero){
   return parseFloat(Math.round(Numero * 100) / 100).toFixed(2);
}

function EfectuarVenta(){      
      
   var mensaje = "";
   var jsonStr = "";
   var Ticket = [];

   for (var key in Vendiendo) {
      var RawInfo = key.split('-');
      var Item = {};
         Item["ProductId"] = RawInfo[0];
         Item["SizeId"] = RawInfo[1];
         Item["Cantidad"] = Vendiendo[key];
         
      Ticket.push(Item);
   }

   jsonStr = JSON.stringify(Ticket);

   $.ajax({
      type: "POST",
      url: "php/GenerarTicket.php",
      data: {ticket : jsonStr}, 
      success: function(data) { 
         alert(data);
      }
   });
}
