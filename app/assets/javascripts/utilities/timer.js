document.addEventListener('turbolinks:load', function() {
  var control = document.getElementById('test-timer').dataset.timer 
  
  if (control && !localStorage.seconds) { 
    var duration = control 
    var content = document.getElementById('test-timer')
    timerStart(duration, content) 
  } else {
    if (localStorage.seconds) {    
      minutes = parseInt(localStorage.getItem("minutes"))
      seconds = parseInt(localStorage.getItem("seconds"))
      if (minutes == 0) { 
        timeLeft = minutes + seconds
      } else {
        minutes = minutes * 60
        timeLeft = minutes + seconds
      }      
      content = document.getElementById('test-timer')  
      timerStart(timeLeft, content)
    }      
  }
})

function timerStart(duration, content) {
  
  var timer = duration, minutes, seconds
  var setTimer = setInterval(function () {  

    minutes = parseInt(timer / 60, 10)
    seconds = parseInt(timer % 60, 10) 

    minutes = minutes < 10 ? "0" + minutes : minutes
    seconds = seconds < 10 ? "0" + seconds : seconds   

    content.textContent = minutes + ":"  + seconds
    
    var endTime = parseInt(minutes + seconds, 10)
    console.log(endTime)

    localStorage.setItem("minutes", minutes)
    localStorage.setItem("seconds",seconds)

    if (--timer < 0) {
      timer = duration 
      content.textContent = "Time is expired"
      clearInterval(setTimer)
      localStorage.clear() 
    }   
   
  }, 1000)
}







      
      


