(function() {
  window.addEventListener('load', function() {
    var login = $('#login-form')
    var signup = $('#signup-form')
    var link = $('#switch-form')
    login.toggle()

    switchLogin = new SwitchLogin(login, signup, link)  
  })
}) ()
