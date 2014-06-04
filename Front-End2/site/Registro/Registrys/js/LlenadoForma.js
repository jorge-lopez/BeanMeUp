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
		//Promociones
		$("#descuento").val(Objeto["Discount"]);
		$('input[name=Description]').val(Objeto["Description"]);
		
		var fechaRAW = Objeto["ExpirationDate"].split("-");
		var fecha = fechaRAW[2] + "/" + fechaRAW[1] + "/" + fechaRAW[0];
		$('input[name=ExpirationDate]').val(Objeto["ExpirationDate"]);

    default:
        break;
    }
}