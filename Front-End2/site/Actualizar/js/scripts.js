
function ObtenerDatos(ArchivoColumnas, ArchivoDatos, URL){

	$.get("php/" + ArchivoColumnas + ".php", function(data) {
	         AgregarColumnasHTML(data);      
	});
	$.get("php/" + ArchivoDatos + ".php", function(data) {
	         LlenarTabla(data, URL);      
	});
}
function AgregarColumnasHTML(ColumasJSON){
	
	var columnas = $.parseJSON(ColumasJSON);
	
	var width = 79/columnas.length;
	var html = "<thead><tr>";

	
	for (var i = 1; i < columnas.length; i++) {		
		html += "<th class='text-center' width='" + width + "%'>" + columnas[i] + "</th>";            
	}

	html += "<th class='text-center' width='21%'> Opciones </th>"
	html += "</tr></thead>";
	$("table#reporte").append(html);
}

function LlenarTabla(TuplasJSON, URL){

	var tuplas = $.parseJSON(TuplasJSON);
	var Id;
	var NumeroFilas = tuplas.length;
	var html = "<tbody>";    
    
    for (var i = 0; i < NumeroFilas; i++) {
    	html += "<tr>";	
    	var temp = tuplas[i];
		for (var key in temp) {
			if(key == "ID")
				Id = temp[key];
			else
				html += '<td>' + temp[key] +'</td>';    			
		}

		html += '<td><ul class="button-group radius">'+
			'<li><a href="../Registro/Registrys/Registry' + URL + '.html?action=Update&Id=' + Id + '" class="button small right">' +
            '<i class="fa fa-pencil-square-o"></i>'+
            '</a></li>'; 
		html += '<li><a href="../Registro/Registrys/Registry' + URL + '.html?action=Delete&Id=' + Id + '" class="button small alert right">' +
            '<i class="fa fa-trash-o"></i>'+
            '</a></li></ul></td>';   
		html += "</tr>";
	}
	html +="</tbody>";
	$("table#reporte").append(html);
}

