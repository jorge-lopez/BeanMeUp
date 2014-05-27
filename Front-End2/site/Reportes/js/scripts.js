
function ObtenerColumnas(){
 	
 	var columnas;
	var jqXHR = $.ajax({
     	url: "php/ReporteEmpleados.php",
		success: function(data) {                
            columnas = data;
        }
      });
   jqXHR.done(function () {
   		AgregarColumnasHTML(columnas);
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
	LlenarTabla(columnas.length);
}
function LlenarTabla(NumeroColumnas){

	var html = "<tbody>";    
    
    for (var i = 0; i < 3; i++) {
    	html += "<tr>";	
		for (var j = 0; j < NumeroColumnas; j++) {
			html += '<td>Content Goes Here</td>';    
		}
		html += "</tr>";
	}
	html +="</tbody>";
	$("table#reporte").append(html);
}

