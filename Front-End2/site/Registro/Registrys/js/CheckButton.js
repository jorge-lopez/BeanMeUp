function InputEmpleado(){  
  
        //the min chars for username  
        var min_chars = 3;  
        var passwordMatch = false;
        var emailIsAvailable = false;
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
                emailIsAvailable = check_availability();                
                // if(passwordMatch == true && emailIsAvailable==true){
                //     $( "input#ButtonEnter" ).prop( "disabled", false ); 
                // }
                // else{
                //     $( "input#ButtonEnter" ).prop( "disabled", true ); 
                // }  
            }  
        });  

        $('input#VPassword').keyup(function(){  
            //run the character number check  
            if($('#Password').val().length < min_chars){  
                //if it's bellow the minimum show characters_error text '  
                $('#Password_Matches').html(characters_error);  
            }else{  
                //else show the cheking_text and run the function to check  
                $('#Password_Matches').html(checking_html);
                passwordMatch = check_password(); 
                // if(passwordMatch == true && emailIsAvailable==true){
                //     $( "input#ButtonEnter" ).prop( "disabled", false ); 
                // }
                // else{
                //     $( "input#ButtonEnter" ).prop( "disabled", true ); 
                // }

            }  
        });
  
  } 


//function to check username availability  
function check_availability(){  
  
    //get the username  
    var result;
    var Email = $('#Email').val();  
  

    var jqXHR = $.ajax({
         type: "POST",
         url: "php/CheckEmployeeEmail.php",
         data: { Email: Email }, 
         success: function(data) { 
           if(data == 1){  
                //show that the username is available  
                $('#username_availability_result').html(Email + ' esta Disponible');
                result = true;
            }else{  
                //show that the username is NOT available  
                $('#username_availability_result').html(Email + ' no esta Disponible');
                result = false; 
            } 
         }
      });
    jqXHR.done(function () {
        return result;
    });
}

function check_password(){  
  
            //get the username  
            var Pass = $('#Password').val();
            var VPass = $('#VPassword').val();  
      
            if (Pass == VPass) {
                $('#Password_Matches').html("Son iguales");
                return true;

              }
              else
              {
                $('Password_Matches').html("No son Iguales");
                return false;
              }
}

function InputProvider(){
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
                check_availability_provider();  
            }  
        });  
  
  }
  
//function to check username availability  
function check_availability_provider(){  
  
        //get the username  
        var Email = $('#Email').val();  
  
        //use ajax to run the check  
        $.post("php/CheckProviderEmail.php", { Email: Email },  
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