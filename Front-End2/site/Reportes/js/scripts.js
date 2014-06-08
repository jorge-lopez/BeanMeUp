
function ObtenerDatos(ArchivoColumnas, ArchivoDatos){

	$.get("php/" + ArchivoColumnas + ".php", function(data) {
	         AgregarColumnasHTML(data);      
	});
	$.get("php/" + ArchivoDatos + ".php", function(data) {
	         LlenarTabla(data);      
	});
}
function AgregarColumnasHTML(ColumasJSON){
	
	var columnas = $.parseJSON(ColumasJSON);
	
	var width = 100/columnas.length;
	var html = "<thead><tr>";

	var i = 1;
	if(columnas[0] != "ID")
		i = 0;

	for (i; i < columnas.length; i++) {	
		html += "<th class='text-center' width='" + width + "%'>" + columnas[i] + "</th>";            
	}

	html += "</tr></thead>";
	$("table#reporte").append(html);
}

function LlenarTabla(TuplasJSON){

	var tuplas = $.parseJSON(TuplasJSON);
	var NumeroFilas = tuplas.length;
	var html = "<tbody>";    
    
    for (var i = 0; i < NumeroFilas; i++) {
    	html += "<tr>";	
    	var temp = tuplas[i];
		for (var key in temp) {
			if(key == "Estado" && temp[key] == "Activo")
				html += '<td><a class="button success small">' + temp[key] +'</a></td>';    
			else if(key == "Estado" && temp[key] == "Inactivo")
				html += '<td><a class="button alert small">' + temp[key] +'</a></td>';
			else if(key != "ID")
				html += '<td>' + temp[key] +'</td>';		  
		}
		html += "</tr>";
	}
	html +="</tbody>";
	$("table#reporte").append(html);
}

//VENTAS
function ObtenerVentaFechas(ArchivoDatos){

	var fechaInicio = $("#dpd1").val();
	var fechaFinal = $("#dpd2").val();

	$.ajax({
		type: "POST",
		url: "php/" + ArchivoDatos + ".php",
		data: { StartDate : fechaInicio, EndDate : fechaFinal },
		success: function(data) {
	         LlenarTablaConDetalles(data);      
		}
	});

}
function ObtenerDatosVenta(ArchivoColumnas, ArchivoDatos){

	$.get("php/" + ArchivoColumnas + ".php", function(data) {
	         AgregarColumnasHTMLConDetalles(data);      
	});
	$.get("php/" + ArchivoDatos + ".php", function(data) {
	         LlenarTablaConDetalles(data);      
	});

}
function AgregarColumnasHTMLConDetalles(ColumasJSON){
	
	var columnas = $.parseJSON(ColumasJSON);
	
	var width = 100/columnas.length;
	var html = "<thead><tr>";

	var i = 1;
	if(columnas[0] != "ID")
		i = 0;

	for (i; i < columnas.length; i++) {	
		if(columnas[i] == "Fecha")
			html += "<th class='text-center' width='250px'>" + columnas[i] + "</th>";            
		else
			html += "<th class='text-center' width='" + width + "%'>" + columnas[i] + "</th>";            
	}
	html += "<th class='text-center' width='" + width + "%'> Detalles </th>";

	html += "</tr></thead>";
	$("table#reporte").append(html);
}
function LlenarTablaConDetalles(TuplasJSON){

	var tuplas = $.parseJSON(TuplasJSON);
	var NumeroFilas = tuplas.length;
	var html = "<tbody>";    
    
    for (var i = 0; i < NumeroFilas; i++) {
    	html += "<tr>";	
    	var temp = tuplas[i];
		for (var key in temp) {
			if(key != "ID")
				html += '<td>' + temp[key] +'</td>';			
		}
		html += '<td><a id="' + temp["ID"] + '" class="button tiny radius" onclick="MostrarDetallesVentas(' + temp["ID"] + ')"><i class="fa fa-sort-desc"></i>	</a></td>';
		html += "</tr>";
	}
	html +="</tbody>";
	$("tbody").empty();
	$("table#reporte").append(html);
}

function MostrarDetallesVentas(Id){
	$.ajax({
		type: "POST",
		url: "php/VentasDetallesInformacion.php",
		data: { ID : Id},
		success: function(data) {
			BeautifyDetalles(data);	        
		}
	});

}

function BeautifyDetalles(ticketJSON){
	var tuplas = $.parseJSON(ticketJSON);
	var NumeroFilas = tuplas.length;
	var width = 100/NumeroFilas;
	var html = "<table><thead><tr>";    

	var temp = tuplas[0];
	for (var key in temp) {
		if(key != "ID")
			html += "<th class='text-center' width='" + width + "%'>" + key + "</th>"; 			
	}		
	html +="</tr></thead><tbody>";
    for (var i = 0; i < NumeroFilas; i++) {
    	html += "<tr>";	
    	var temp = tuplas[i];
		for (var key in temp) {
			if(key != "ID")
				html += '<td>' + temp[key] +'</td>';			
		}
		
		html += "</tr>";
	}
	html +="</tbody></table>";

	$.colorbox({html: html, onLoad: function() {
         $('#cboxClose').remove();
      }
   }); 
	

}

//Proveedores
function BusquedaProveedores(){
	
	var qry = $("input#query").val();

	$.ajax({
		type: "POST",
		url: "php/ProveedoresBuscarInformacion.php",
		data: { NombreProveedor : qry},
		success: function(data) {
			$("tbody").remove();
        	LlenarTabla(data); 	        
		}
	});

}

//Empleados
function BusquedaEmpleados(){
	
	var qry = $("input#query").val();

	$.ajax({
		type: "POST",
		url: "php/EmpleadosBuscarInformacion.php",
		data: { NombreEmpleado : qry},
		success: function(data) {
			$("tbody").remove();
        	LlenarTabla(data); 	        
		}
	});

}

