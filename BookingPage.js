$(document).ready(function() {
var used = new Array();

    $.ajax({
        url: 'GetEle',
        type: 'POST',
        dateType: 'json',
        data: $('#initalise').serialize(),
        success: function(data) {
            var selectedList = $('#BuildingName');
            selectedList.empty();
            selectedList.append($('<option></option>').val(0).html("Choose a Building"));
            $.each(data, function(index, item) {
                selectedList.append(
                $('<option></option>').val(index+1).html(item)
            );
            });
            $('#RdyS1').attr('value', '2');
            $('#RdyS2').attr('value', '2');
            
        }
    });


    $('#BuildingName').change(function(){
        $('#RdyS2').attr('value', '2');
        $.ajax({
                url: 'GetEle',
                type: 'POST',
                dateType: 'json',
                data: $('#getSlots').serialize(),
                success: function(data) {
                    var selectedList2 = $('#FacilityID');
                    selectedList2.empty();
                    selectedList2.append('<option>Choose Sport</option>')
                    $.each(data, function(index, item) {
                        selectedList2.append($('<option></option>').val(item).html(item));
                    });
                    
                }
            });
        
        
    });
    
    $('#FacilityID').change(function(){
        $('#RdyS2').attr('value', '3');
        $.ajax({
                url: 'GetEle',
                type: 'POST',
                dateType: 'json',
                data: $('#getSlots').serialize(),
                success: function(data) { 
                    var selectedList3 = $('#CourtNo');
                    selectedList3.empty();
                    selectedList3.append($('<option></option>').val(0).html("Choose Court"));
                    $.each(data, function(index, item) {
                        selectedList3.append($('<option></option>').val(item).html(item));
                        
                    });
                    
                }
            });
        
        
    });



 
  $('#CourtNo').change(function() {
        //Clear the table back to all Available
      /*  for(var j = 0; j<7; j++){
                    for(var k = 0; k<10; k++){
                        $("#A"+j+""+k).removeClass('Booked').addClass('Available');
                         $("#A"+j+""+k).text("Available");
                    }
                }*/
        for(var i=0; i<used.length;i++){
            $(used[i]).removeClass('Booked').addClass('Available');
                         $(used[i]).text("Available");
        }
        used = [];
        //Query the date for each day of the week and appended to table
        $.ajax({
            url: 'startEnd',
            type: 'POST',
            dateType: 'json',
            data: $('#getSlots').serialize(),
            success: function(data) {
                var d = 0;
                $.each(data, function(key, val){
                    $("#D"+d).text(val);
                    d++;
                });

            }
        });
        //Query the status of each slot and update the table
        $.ajax({
            url: 'test2',
            type: 'POST',
            dateType: 'json',
            data: $('#getSlots').serialize(),
            success: function(data) {
                
                $.each(data, function(key, val){
                    for(var i = 0; i<val.numhrs;i++){
                      var slot = val.slot + i;
                      $("#A"+val.day+""+slot).removeClass('Available').addClass('Booked');
                      $("#A"+val.day+""+slot).text("Booked");
                      used.push("#A"+val.day+""+slot);
                    }
                });


            }
        });
    });

    $('#datepicker').change(function() {
        //Clear the table back to all Available
      /*  for(var j = 0; j<7; j++){
                    for(var k = 0; k<10; k++){
                        $("#A"+j+""+k).removeClass('Booked').addClass('Available');
                         $("#A"+j+""+k).text("Available");
                    }
                }*/
        for(var i=0; i<used.length;i++){
            $(used[i]).removeClass('Booked').addClass('Available');
                         $(used[i]).text("Available");
        }
        used = [];
        //Query the date for each day of the week and appended to table
        $.ajax({
            url: 'startEnd',
            type: 'POST',
            dateType: 'json',
            data: $('#getSlots').serialize(),
            success: function(data) {
                var d = 0;
                $.each(data, function(key, val){
                    $("#D"+d).text(val);
                    d++;
                });

            }
        });
        //Query the status of each slot and update the table
        $.ajax({
            url: 'test2',
            type: 'POST',
            dateType: 'json',
            data: $('#getSlots').serialize(),
            success: function(data) {
                
                $.each(data, function(key, val){
                    for(var i = 0; i<val.numhrs;i++){
                      var slot = val.slot + i;
                      $("#A"+val.day+""+slot).removeClass('Available').addClass('Booked');
                      $("#A"+val.day+""+slot).text("Booked");
                      used.push("#A"+val.day+""+slot);
                    }
                });


            }
        });
    });



    

});