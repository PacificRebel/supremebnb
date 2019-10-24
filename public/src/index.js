(function() {
  window.addEventListener('load', function() {
    login = $('#login-form')
    signup = $('#signup-form')
    link = $('#switch-form')
    console.log(login)
    console.log(signup)
    console.log(link)
    login.toggle()
    new SwitchLogin(login, signup, link)
  })
}) ()
