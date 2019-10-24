(function(exports) {
  function SwitchLogin(login, signup, link) {
    this.loginForm = login
    this.signUpForm = signup  
    this.link = link
    console.log(this.login)

    this.link.on('click', this.switchForm)
  }
  SwitchLogin.prototype = {
    switchForm: function() {
      this.loginForm.toggle()
      this.signUpForm.toggle()
    },
  }
  exports.SwitchLogin = SwitchLogin
})(this)