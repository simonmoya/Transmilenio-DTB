    $(function() {
        $('input[type=text-d]').datepicker(
            {
                dateFormat: "yy-mm-dd",
                dayNames: [ "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado" ],
                dayNamesMin: [ "Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa" ],
                firstDay: 1,
                gotoCurrent: true,
                monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ]
            }
        );
    });


    $(function() {
     $('input[type=radio]').click(function() {
      var group = $(this).attr('id');
      $('input[id='+group+']').not(this).prop('checked',false);  		
     });
    });

