document.addEventListener('turbolinks:load', function() {
  var control = document.getElementById('test-timer')

  if (control) { 
    if (control.dataset.timer) {
      timerStart()
    }
   }
})

function timerStart() {
  var refreshIntervalId  = setInterval(timerStart, 500)
  var timeEnd = document.getElementById('test-timer').dataset.timeEnd * 1000
  var timeLeft = Math.round(Math.abs(new Date(timeEnd) - new Date()))
  var actualTime = new Date(timeLeft)

  minutes = actualTime.getMinutes()
  seconds = actualTime.getSeconds() 
  
  minutes = minutes < 10 ? "0" + minutes : minutes
  seconds = seconds < 10 ? "0" + seconds : seconds  
  console.log(minutes)
  console.log(seconds)

  document.getElementById('test-timer').textContent = minutes + ":" + seconds

  if (minutes ==  00  && seconds == 00) {
    clearInterval(refreshIntervalId)
    document.getElementById('test-timer').textContent = 'Time is expired'
    submitForm()
  }
}

function submitForm() {
  var formTag = document.querySelector('#test-passage-form')
  if (formTag) { formTag.submit() }
}


