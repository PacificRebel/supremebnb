(function() {
  window.addEventListener('load', function() {
    login = $('#login-form')
    signup = $('#signup-form')
    link = $('#switch-form')
    login.toggle()

    switchLogin = new SwitchLogin(login, signup, link)  
  })
}) ()
