$(document).ready(function() {  
  
        //the min chars for username  
        var min_chars = 3;  
  
        //result texts  
        var characters_error = 'Minimum amount of chars is 3';  
        var checking_html = 'Checking...';  
  
        //when button is clicked  
        $('input#Email').keyup(function(){  
            //run the character number check  
            if($('#Email').val().length < min_chars){  
                //if it's bellow the minimum show characters_error text '  
                $('#username_availability_result').html(characters_error);  
            }else{  
                //else show the cheking_text and run the function to check  
                $('#username_availability_result').html(checking_html);
                check_availability()  
            }  
        });  
  
  });  
  
//function to check username availability  
function check_availability(){  
  
        //get the username  
        var Email = $('#Email').val();  
  
        //use ajax to run the check  
        $.post("checkProvidersEmail.php", { Email: Email },  
            function(result){  
                //if the result is 1  
                if(result == 1){  
                    //show that the username is available  
                    $('#username_availability_result').html(Email + ' esta Disponible');
                    $( "input#ButtonEnter" ).prop( "disabled", false );    
                }else{  
                    //show that the username is NOT available  
                    $('#username_availability_result').html(Email + ' no esta Disponible');
                    $( "input#ButtonEnter" ).prop( "disabled", false );  
                }  
        });  
  
}