document.addEventListener('turbolinks:load', function() {
  var control = document.querySelectorAll('input[type=password]')
  
  if (control) { 
    for(var i = 0; i < control.length; i++) {
      control[i].addEventListener('input', comparePasswordFields) }
  }   
})

  function comparePasswordFields(){
    var newPassword = document.getElementById('user_password')
    var confirmPassword = document.getElementById('user_password_confirmation')
    var passworField = document.querySelector('.password_confirm')

    if (newPassword.value == confirmPassword.value && newPassword.value != "" ) {
      confirmPassword.style.backgroundColor  = "#66cc66"
      passworField.querySelector('.octicon-check').classList.remove('hide')
    } else if (newPassword.value == "" || confirmPassword.value == "") {
      confirmPassword.style.backgroundColor = "transparent"
      passworField.querySelector('.octicon-check').classList.add('hide')
    } else {
      confirmPassword.style.backgroundColor = "#ff6666" 
      passworField.querySelector('.octicon-check').classList.add('hide')     
    }
  }
