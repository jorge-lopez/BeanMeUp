function LlenarCampos(Funcion, Id, Actor){
	
	if(Funcion != "Insert"){    		
		$.post("php/" + Actor + "Get.php", {ID : Id}, function(data) {
		         LlenarForma(data);      
		});
	}
}
function LlenarForma(InfoJSON){
	var Info = $.parseJSON(InfoJSON);
	var Objeto = Info[0];

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

	//Proveedor
	$("#FirstName").val(Objeto["ProviderName"]);
	$('input[name=NombreCompania]').val(Objeto["ProviderCompany"]);
	$("#Email").val(Objeto["ProviderEmail"]);
	$("#phone").val(Objeto["ProviderPhone"]);
	$("#phone2").val(Objeto["ProviderCellphone"]);
	$("#Address").val(Objeto["ProviderAddress"]);

	///PROCEDURE u304295155_bnmup.sp_Coupon_ByID does not exist
	
}