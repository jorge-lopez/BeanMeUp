
var subtotal = 0;
var InfoBebidas;
var Vendiendo = [];
var IdVenta = 0;

function AgregarProductoHTML(drinks) {

   $(jQuery.parseJSON(drinks)).each(function() {  
      var nombre = this.ProductName;
      var id = this.ProductID;
      var imagen = this.ProductPicture;

      $("#lista-productos").append(
         '<li>'+
         '<a class="th product" onclick="GuardarProducto('+ id +",'"+ nombre +'\')">' +
         '<img src="img/bebidas/' + imagen + '">' +
         '<label>' + nombre + '</label>' +
         '</a></li> ');
   });
   
   $("a.product").colorbox({
      href:"tamagnos.html", onLoad: function() {
         $('#cboxClose').remove();
      }
   });  
}

function GuardarProducto(IdBebida, Nombre)
{
   InfoBebidas = [IdBebida, Nombre];      
}

function AgregarProducto(IndexTamagno, StringTamagno) {

   parent.jQuery.colorbox.close();
	var producto = InfoBebidas[1] + " " + StringTamagno;   
   var precio;
   var jqXHR = $.ajax({
         type: "POST",
         url: "ObtenerPrecio.php",
         data: {IdProducto : InfoBebidas[0]}, 
         success: function(data) { 
            var tempArray = jQuery.parseJSON(data);
            precio = parseInt(tempArray[IndexTamagno].Price);
         }
      });
   jqXHR.done(function () {
   	$("#lista-total").append("<li><a class='small button secondary expand' ><span class='left'> " 
                                 + producto + "</span><span class='right'>$" + precio + " </span></a></li>" );	

   	subtotal = subtotal + precio;
   	var iva = (subtotal * .16).toFixed(2);
   	var total = (subtotal * 1.16).toFixed(2);

   	document.getElementById("total").innerHTML = "SubTotal: " + subtotal + " <br>" + 
   							"Iva: " + iva + " <br>" + 
   							"Total: " + total;						

   // AddingProductsToTicket(IdProducto, Categoria, Nombre, Tamagno, Precio)
      AddingProductsToTicket(InfoBebidas[0], 1, InfoBebidas[1], IndexTamagno + 1, precio);
   });
}


function AddingProductsToTicket(IdProducto, Categoria, Nombre, Tamagno, Precio){   


   var Producto = {
      "IdProducto" : IdProducto, 
      "Categoria" : Categoria,
      "Nombre" : Nombre,
      "Tamagno" : Tamagno,
      "Precio" : Precio      
   };
   
   
   Vendiendo.push(Producto);    


}
function EfectuarVenta(){
      var mensaje = "";
   $(Vendiendo).each(function() {  
         var nombre = this.IdProducto;
         var categoria = this.Categoria;
         var id = this.Nombre;
         var imagen = this.Tamagno;
         var ch = this.Precio;

      mensaje = mensaje + "| " + nombre + ", " + categoria + ", " + id + ", " + imagen + ", " + ch;
   });
   alert(mensaje);
      //1-ch 2-md 3-gd
   //1-bebidas 2-snacks
}
function PostingPosts(){

   $.post( "test.php", { 'choices': Vendiendo.toString() } )
      .done(function( data ) {
         alert( "Data Loaded: " + data );
      });
   //$.post( "test.php", );
}

function KeyArray(){
var Id = 1;
var tm = "ch";
var mensaje = "";

 var Producto = {
      "IdProducto" : 1, 
      "Categoria" : 1,
      "Nombre" : "Cafe del Dia",
      "Tamagno" : 1,
      "Precio" : 20      
   };

    var map = new Object();  
    map[Id + tm] = new Array();  
    map[Id + tm].push(Producto);
    map[Id + "md"] = new Array();
    map[Id + "md"].push(Producto);
    


//var arreglo = Object.getOwnPropertyNames(map);

for (var key in map) {
   mensaje = mensaje + '||  name=' + key + ' value={';

   var arreglo = map[key];

   for (var i = 0; i < arreglo.length; i++)
   {
      var objeto = arreglo[i];
      var arregloPropiedades = Object.getOwnPropertyNames(objeto);
      
      for (var j = 0; j < arregloPropiedades.length; j++)
      {
          mensaje = mensaje + '||  name=' + arregloPropiedades[j] + ' value=' + objeto[arregloPropiedades[j]];
      }
   }
   
   mensaje = mensaje + arreglo +  "}";
   // do some more stuff with obj[key]
}


alert(mensaje);
// alert(Object.getOwnPropertyNames(map));
}

