function LlenarCampos(Funcion, Id, Actor){
	
	if(Funcion != "Insert"){    		
		$.post("php/" + Actor + "Get.php", {ID : Id}, function(data) {
		         LlenarForma(data, Actor);      
		});
	}
}
function LlenarForma(InfoJSON, Actor){
	var Info = $.parseJSON(InfoJSON);
	var Objeto = Info[0];

	switch(Actor) {
    case "Empleado":
    	//Empleado y Campos Comunes
		$("#Password").prop("type", "text");
		$("#VPassword").prop("type", "text");
			
		$("#FirstName").val(Objeto["FirstName"]);
		$("#LastName").val(Objeto["LastName"]);
		
		$("#Email").val(Objeto["Email"]);
		$("#phone").val(Objeto["Phone"]);
		$("#salary").val(Objeto["Salary"]);
		$("#Address").val(Objeto["Address"]);

		if(Objeto["Gender"] == "Male")
			$("#Male").prop("checked", true);
		else
			$("#Female").prop("checked", true);

		if(Objeto["Active"] == "Active")
			$("#Active").prop("checked", true);
		else
			$("#Inactive").prop("checked", true);

		if(Objeto["PositionID"] == "1")
			$("#Cajero").prop("checked", true);
		else if(Objeto["PositionID"] == "2")
			$("#Supervisor").prop("checked", true);
		else if(Objeto["PositionID"] == "3")
			$("#Gerente").prop("checked", true);


		$("#Password").val(Objeto["Password"]);	
		$("#VPassword").val(Objeto["Password"]);

        break;
    case "Proveedor":
        //Proveedor
		$("#FirstName").val(Objeto["ProviderName"]);
		$('input[name=NombreCompania]').val(Objeto["ProviderCompany"]);
		$("#Email").val(Objeto["ProviderEmail"]);
		$("#phone").val(Objeto["ProviderPhone"]);
		$("#phone2").val(Objeto["ProviderCellphone"]);
		$("#Address").val(Objeto["ProviderAddress"]);

        break;

	case "Promociones":
		
		$("#descuento").val(Objeto["Discount"]);
		$('input[name=Description]').val(Objeto["Description"]);
		
		var fechaRAW = Objeto["ExpirationDate"].split("-");
		var fecha = fechaRAW[2] + "/" + fechaRAW[1] + "/" + fechaRAW[0];
		$('input[name=ExpirationDate]').val(Objeto["ExpirationDate"]);

	case "Inventario":
		$("#StockName").val(Objeto["StockName"]);
		 setTimeout(function (){
            var sel = document.getElementById('Unidad');
			sel.selectedIndex = Objeto["UnitID"] - 1;
         }, 500); 
		


    default:
        break;
    }
}

function LlenarUnidades(){
	
	$.get("php/InventarioLoadUnidades.php",  function(data) {
		         var unidadesJSON = $.parseJSON(data);
		         $(unidadesJSON).each(function() {
		         	$("#Unidad").append('<option value="' + this.UnitID + '">' + this.UnitName + '</option>');
		         });
		});
}
function LlenarProveedores(){
	
	$.get("php/ProveedorLoadNombres.php",  function(data) {
		         var unidadesJSON = $.parseJSON(data);
		         $(unidadesJSON).each(function() {
		         	$("#Proveedor").append('<option value="' + this.ID + '">' + this.Compa\u00f1ia + '|' + this.Nombre + '</option>');
		         });
		});
}

function AgregarConsumible(){
	var html = '<div class="row">' +
         '<div class="large-6 columns">' +
         '<input type="hidden" class="id" name="ID">'+
         
             '<label>Materia Prima' +
               '<input type="text" class="Consumible" name="Consumible" onclick="AutocompleteOrdenStock(this)"  onblur="AutocompleteUnidades(this)">' +
             '</label>' +

         '</div>' +
         '<div class="large-3 columns">' +

             '<label>Unidad' +                
               '<input type="text" value="" class="unidad" disabled>' +
             '</label>' +
          
         '</div>' +
         '<div class="large-3 columns">' +

             '<label>Agregar Consumible' +                
               '<a class="tiny button radius success" onclick="AgregarConsumible()" >' +
                 '<i class="fa fa-plus-square-o fa-lg"></i>' +
               '</a>&nbsp;' +
               '<a class="tiny button radius alert" onclick="EliminarConsumible(this)">' +
                 '<i class="fa fa-minus-square-o fa-lg"</i>' +
               '</a>' +
             '</label>' +
          
         '</div>' +
       '</div>';

    $("#lista-Consumibles").append(html);
}
function AutocompleteOrdenStock(input){

	var qry = input.value;

	$.post("php/ConsumiblesBuscarInformacion.php", {NombreConsumible : qry}, function(data) {
		var consumiblesJSON = $.parseJSON(data);		
		var nombres = [];
	         $(consumiblesJSON).each(function(){
	         	nombres.push(this.Consumible);	         	
	         });


		$(".Consumible").autocomplete({
			source: nombres
		})
		$('.ui-autocomplete').addClass('f-dropdown');
	});
}
function AutocompleteUnidades(inputElement){
	
	var qry = inputElement.value;
	$.post("php/ConsumiblesBuscarInformacion.php", {NombreConsumible : qry}, function(data) {
		var consumiblesJSON = $.parseJSON(data);		
		var unidades = [];
		var ids = [];		
	         $(consumiblesJSON).each(function(){
	         	unidades.push(this.Unidad);
	         	ids.push(this.ID);
	         });

		var parent = $(inputElement).closest("div.row");
		var childrenU = $(parent[0]).find("input.unidad");		
		var childrenI = $(parent[0]).find("input.id");

		childrenU[0].value = unidades[0];
		childrenI[0].value = ids[0];
	});
}

function EliminarConsumible(inputElement){

	var parent = $(inputElement).closest("div.row");
	parent[0].parentNode.removeChild(parent[0]);

}