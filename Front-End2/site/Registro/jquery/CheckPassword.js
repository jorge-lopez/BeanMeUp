$(document).ready(function() {  
  
        //the min chars for username  
        var min_chars = 8;  
  
        //result texts  
        var characters_error = 'Minimum amount of chars is 8';  
        var checking_html = 'Checking...';  
  
        //when button is clicked  
        $('input#VPassword').keyup(function(){  
            //run the character number check  
            if($('#Password').val().length < min_chars){  
                //if it's bellow the minimum show characters_error text '  
                $('#Password_Matches').html(characters_error);  
            }else{  
                //else show the cheking_text and run the function to check  
                $('#Password_Matches').html(checking_html);
                check_password()  
            }  
        });  
  
  });  


  


//function to check username availability  
function check_password(){  
  
            //get the username  
            var Pass = $('#Password').val();
            var VPass = $('#VPassword').val();  
      
            if (Pass == VPass) {
                $('#Password_Matches').html("Son iguales");
                $( "input#ButtonEnter" ).prop( "disabled", false ); 

              }
              else
              {
                $('Password_Matches').html("No son Iguales");
                $( "input#ButtonEnter" ).prop( "disabled", true );  
              }
}
