(function(exports) {
  function SwitchLogin(login, signup, link) {
    this.loginForm = login
    this.signUpForm = signup  
    this.link = link  
    var self = this
    this.link.on('click', function(){self.switchForm()})
  }
  SwitchLogin.prototype = {
    switchForm: function() {
      this.loginForm.toggle()
      this.signUpForm.toggle()
    },
  }
  exports.SwitchLogin = SwitchLogin
})(this)