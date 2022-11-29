

let btn_update = document.getElementsByClassName("btn_update");
let control = document.getElementsByClassName("control");

function update(m){
	control[m-1].disabled = false;
}


   	
$(document).ready(function(){
    $(".toggle_icon_1, .toggle_icon_2, .toggle_icon_3").click(function(){
      $(this).toggleClass("fa-eye fa-eye-slash");
      if ($(this).parent('span:first').prev().attr("type") === 'password'){
        $(this).parent('span:first').prev().attr("type", "text");
      }
      else $(this).parent('span:first').prev().attr("type", "password");
    });
  });