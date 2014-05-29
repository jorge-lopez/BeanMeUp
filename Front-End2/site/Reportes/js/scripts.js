
function ObtenerDatos(){

	$.get("php/ReporteEmpleados.php", function(data) {
	         AgregarColumnasHTML(data);      
	});
	$.get("php/InformacionEmpleados.php", function(data) {
	         LlenarTabla(data);      
	});
}
function AgregarColumnasHTML(ColumasJSON){
	
	var columnas = $.parseJSON(ColumasJSON);
	
	var width = 100/columnas.length;
	var html = "<thead><tr>";

	$(columnas).each(function(){			
		html += "<th class='text-center' width='" + width + "%'>" + this + "</th>"            
	});	

	html += "</tr></thead>";
	$("table#reporte").append(html);
}

function LlenarTabla(TuplasJSON){

	var tuplas = $.parseJSON(TuplasJSON);
	var NumeroFilas = tuplas.length;
	var html = "<tbody>";    
    
    for (var i = 0; i < 3; i++) {
    	html += "<tr>";	
    	var temp = tuplas[i];
		for (var key in temp) {
			html += '<td>' + temp[key] +'</td>';    
		}
		html += "</tr>";
	}
	html +="</tbody>";
	$("table#reporte").append(html);
}

