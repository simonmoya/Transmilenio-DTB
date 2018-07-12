<%-- 
    Document   : index
    Created on : 01/23/2018, 10:12:46 PM
    Author     : Simón Moya Jiménez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="Shortcut Icon" href="resources/images/favicon.ico" type="image/x-icon" />

    <title>Dashboard Dirección Técnica de Buses</title>

    <!-- Bootstrap Core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="resources/css/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="resources/css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="resources/css/dataTables.responsive.css" rel="stylesheet">
    <link href="resources/css/jquery.dataTables.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
    <link href="resources/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="resources/css/jquery-ui.css" />
	

    <style>	
.dt-button-collection {
left: 0px;
}

.panel-title2 {
    height:18px
}
.panel-title2 a {
    float:left;
    text-decoration:none;
    padding: 0px 430px;
    margin: -20px -430px;
}

	</style>

</head>

<body>
	
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">	
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Dashboard Dirección Técnica de Buses</a>
            </div>
		    <ul class="nav navbar-nav navbar-right">
			<li>
                          <input type="text" name="fecha" id="fecha" value="" readonly style="width:120px; color: #707070; background-color: #f8f8f8; border-width:0; margin-top: 15px; margin-right: 160px; margin-left: 30px; cursor:pointer">
                        </li>
			</ul>
			
		</nav>
		
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">KPI Flota</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

			
            <div class="row">
                <div class="col-lg-4" >
	
                    <div class="panel panel-default">
                        <div class="panel-heading" style="font-weight: bold;">
                            Concesionario
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="div-operators" class="table-responsive">

                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
                <!-- /.col-lg-6 -->

                <div class="col-lg-8" >
                    <div class="panel panel-default">
                        <div id="panel_operator" class="panel-heading" style="font-weight: bold;">
                            Información Flota
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
						
		<div class="row">

                <div class="col-lg-4 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-bus fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div id="indicador_flota" class="huge">71%</div>
                                    <div>Capacidad Operativa</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                            <div id="detail_operator" class="table-responsive table-bordered" align="center">
								
                            </div>
                            </div>
                        </a>
                    </div>
					
					
                                <div>
                                    <p>
                                        <strong>Flota Programada</strong>
                                        <span id="flota_programada" class="pull-right text-muted" style="cursor: pointer;">Buses</span>
                                    </p>
                                    <div class="progress active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                        </div>
                                    </div>
                                </div>
								
                                <div>
                                    <p>
                                        <strong>Flota Asignada</strong>
                                        <span id="flota_asignada" class="pull-right text-muted" style="cursor: pointer;">Buses</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </div>		

                                <div>
                                    <p>
                                        <strong>Flota Inmovilizada</strong>
                                        <span id="flota_inmovilizada" class="pull-right text-muted" style="cursor: pointer;">Buses</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
								
                                <div>
                                    <p>
                                        <strong>Flota Desvinculada</strong>
                                        <span id="flota_desvinculada" class="pull-right text-muted" style="cursor: pointer;"></span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>	
                    
                                <div>
                                    <p>
                                        <strong>Flota Vinculada</strong>
                                        <span id="flota_vinculada" class="pull-right text-muted" style="cursor: pointer;"></span>
                                    </p>
                                </div>	                    
																		
                    <!-- /.panel -->							
							

                                </div>								
                            </div>
                            
                            
                            
            <div class="row">
            <div class="panel-group" id="accordion">

                    <div class="panel panel-default">
					
                    <div class="panel-heading panel-heading2">
                         <h4 class="panel-footer panel-title2">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                  <i class="fa fa-table fa-fw"></i> <span id="title_detail" style="font-weight: bold;">Información Detallada</span>
                </a>
              </h4>
                    </div>
						
				<div id="collapseOne" class="panel-collapse collapse">								
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <!-- /.col-lg-8 (nested) -->
								
                                    <div id="table_flota_operador" class="table-responsive" style="width:100%; border-bottom: 0px;">
                                        	<div id="div-resultado" class="panel-body" style="padding: 0px 15px 15px"></div>

                                        <table id="info_flota_operador" class="display" style="width:100%">
                                            <thead>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->

                                <!-- /.col-lg-4 (nested) -->

                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.panel-body -->
						
					</div> <!-- Finaliza Sección	-->
						
                    </div>
    <!-- /.accordion -->					
	</div>							        
            </div>                            
                            
                            
                        </div>						
                    </div>
                </div>
            </div>
        

        
        </div>

    <!-- jQuery -->
    <script src="resources/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="resources/js/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="resources/js/jquery.dataTables.min.js"></script>
    <script src="resources/js/dataTables.bootstrap.min.js"></script>
    <script src="resources/js/dataTables.responsive.js"></script>

    <script src="resources/js/dataTables.select.min.js"></script>
    <script src="resources/js/dataTables.buttons.min.js"></script>
	<script src="resources/js/jszip.min.js"></script>
    <script src="resources/js/pdfmake.min.js"></script>
	<script src="resources/js/vfs_fonts.js"></script>
    <script src="resources/js/buttons.html5.min.js"></script>
	<script src="resources/js/buttons.print.min.js"></script>		

	    <!-- Custom Theme JavaScript -->
    <script src="resources/js/sb-admin-2.js"></script>
    <script src="resources/js/jquery-ui.js"></script>

	<script>
    var operador = 0;
            
$(document).ready(function() {

	var meses = new Array ("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
	var f=new Date();
	$('#fecha').val(f.getFullYear()+"/"+(f.getMonth()+1)+"/"+f.getDate());
        load_operator();
 
    var table = $('#operators_table').DataTable();
	     
    $('#operators_table tbody').on('click', 'td', function () {
                var data = table.row( this ).data();
                total = data[1].replace('.', '');
                inmovilizada = data[2].replace('.', '');
                asignado = data[3].replace('.', '');
                programado = data[4].replace('.', '');
                desvinculada = data[5].replace('.', '');
		$('#panel_operator').html("Flota Concesionario: "+data[0]);
		$('#detail_operator').html("Flota Total: "+data[1]+" Buses");
		$('#flota_inmovilizada').html(data[2]+" Buses");                
		$('#flota_asignada').html(data[3]+" Buses");                
		$('#flota_programada').html(data[4]+" Buses"); 
                vinculada = parseInt(total.replace(',', '')) -(parseInt(desvinculada.replace(',', '')) + parseInt(inmovilizada.replace(',', '')));
		$('#flota_desvinculada').html(data[5]+" Buses"); 
		$('#flota_vinculada').html(vinculada+" Buses"); 
                operador = $(this).closest('td')[0].id;
                indicador = (asignado.replace(',', '')/programado.replace(',', ''))*100;
		$('#indicador_flota').html((indicador.toFixed(2))+"%");                                 
    } );	
 
    $('#operators_table tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    } );        

    $('#button').click( function () {
        table.row('.selected').remove().draw( false );
    } );
	
    $('#fecha').change( function () {
        $('#title_detail').html("Información Detallada");
        load_operator();
    } );
    
    $('#detail_operator').click( function () {
	$('#title_detail').html("Información Detallada - Flota Total");
	$('#div_resultado').html("");
        load_table(operador,1);
    } );	

    $('#flota_programada').click( function () {
	$('#title_detail').html("Información Detallada - Flota Programada");
        load_table(operador,2);
    } );	

    $('#flota_asignada').click( function () {
	$('#title_detail').html("Información Detallada - Flota Asignada");
        load_table(operador,3);
    } );	
	
    $('#flota_inmovilizada').click( function () {
	$('#title_detail').html("Información Detallada - Flota Inmovilizada");
        load_table(operador,4);
    } );	

    $('#flota_desvinculada').click( function () {
	$('#title_detail').html("Información Detallada - Flota Desvinculada");
        load_table(operador,5);
    } );	

    $('#flota_vinculada').click( function () {
	$('#title_detail').html("Información Detallada - Flota Vinculada");
        load_table(operador,6);
    } );	
        
} );


function load_table(operador, type) { 
         fecha = $('#fecha').val();
         $.ajax({ //Comunicación jQuery hacia JSP
           type: "POST",
           url: "GetInfoFlota.jsp",
           data: "operador="+operador+"&type="+type+"&fecha="+fecha,
           beforeSend: function(){
                          //imagen de carga
                          $("#div-resultado").html("<p align='center'><img src='resources/images/ajax-loader.gif' /></p>");
                    },           
           success: function(result){
           var dataSet = result.replace(/'/g, '"');
           dataSet = JSON.parse(dataSet);
	$('#info_flota_operador').dataTable( {
        data: dataSet,    
        "dom": '<"top"B>t<"bottom"lp><"clear">',
        select: true,
        columns: [
            { title: "Concesionario" },
            { title: "Cod. Bus" },
            { title: "Matricula" },
            { title: "Tipo Vehículo" },
            { title: "Capacidad" },
            { title: "Tipo Servicio" }
        ],        
        buttons: [
            {
                extend: 'collection',
                text: 'Export',
                buttons: [
                    'excel',
                    'csv',
                    'pdf'
                ]
            }
        ],
        "bDestroy": true
    } );         
    $("#div-resultado").empty();
           },
           error: function(xml,msg){
               $("#info_flota_operador").text(" Error");
           },
           
        complete: function(result) {
            
            //A function to be called when the request finishes 
            // (after success and error callbacks are executed). 
        }           
        });           
                
}

function load_operator() { 
         fecha = $('#fecha').val();
	 $('#panel_operator').html("");
	 $('#detail_operator').html("Información Detallada");
	 $('#flota_total').html("");
	 $('#flota_inmovilizada').html("");                
	 $('#flota_asignada').html("");                
	 $('#flota_programada').html(""); 
 	 $('#indicador_flota').html("");                 
 	 $('#flota_desvinculada').html("");                 
         
         $.ajax({ //Comunicación jQuery hacia JSP
           type: "POST",
           url: "GetInfoOperador.jsp",
           data: "fecha="+fecha,
           beforeSend: function(){
                          //imagen de carga
                          $("#div-operators").html("<p align='center'><img src='resources/images/ajax-loader.gif' /></p>");
                    },           
           success: function(result){        
            $("#div-operators").empty();
            $("#div-operators").html(result);

	$('#operators_table').dataTable({
		"dom": "lr",
        "paging":   false,
        "ordering": false,
        "bfilter": false,
        "info":     false,
        "language": {
        "emptyTable": "No hay información para este día."
        },        
        "columnDefs": [
            {
                "targets": [ 1, 2, 3, 4, 5 ],
                "visible": false,
                "searchable": false
            }
        ],
        "bDestroy": true
	});

        
    var table = $('#operators_table').DataTable();
	     
    $('#operators_table tbody').on('click', 'td', function () {
                var data = table.row( this ).data();
                total = data[1].replace('.', '');
                inmovilizada = data[2].replace('.', '');
                asignado = data[3].replace('.', '');
                programado = data[4].replace('.', '');
                desvinculada = data[5].replace('.', '');
		$('#panel_operator').html("Flota Concesionario: "+data[0]);
		$('#detail_operator').html("Flota Total: "+data[1]+" Buses");
		$('#flota_inmovilizada').html(data[2]+" Buses");                
		$('#flota_asignada').html(data[3]+" Buses");                
		$('#flota_programada').html(data[4]+" Buses"); 
                vinculada = parseInt(total.replace(',', '')) -(parseInt(desvinculada.replace(',', '')) + parseInt(inmovilizada.replace(',', '')));
		$('#flota_desvinculada').html(data[5]+" Buses"); 
		$('#flota_vinculada').html(vinculada+" Buses"); 
                operador = $(this).closest('td')[0].id;
                indicador = (asignado.replace(',', '')/programado.replace(',', ''))*100;
		$('#indicador_flota').html((indicador.toFixed(2))+"%");                                 
    } );	
 
    $('#operators_table tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    } );        
           },
           error: function(xml,msg){
               $("#div-operators").text(" Error");
           },
           
        complete: function(result) {
            
            //A function to be called when the request finishes 
            // (after success and error callbacks are executed). 
        }           
        });           
}


    $(function() {
        $("#fecha").datepicker(
            {
                dateFormat: "yy/mm/dd",
                dayNames: [ "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado" ],
                dayNamesMin: [ "Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa" ],
                firstDay: 1,
                gotoCurrent: true,
                monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ]
            }
        );
    });

	</script>

	
</body>

</html>