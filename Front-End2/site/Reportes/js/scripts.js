
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
			if(key != "ID")
				html += '<td>' + temp[key] +'</td>';    
		}
		html += "</tr>";
	}
	html +="</tbody>";
	$("table#reporte").append(html);
}

