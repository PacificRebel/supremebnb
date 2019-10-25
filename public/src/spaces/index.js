(function() {
  window.addEventListener('load', function() {
    var dateOfStay = $('#date-of-stay')
    var submitDate = $('#submit-date')
    var content = $('#content')
    var pageTitle = $('#page-title')
    var url = '/spaces'
    content.load(url)
    submitDate.on('click', function() {
      content.load(url + `?date=${dateOfStay.val()}`)
    })
  })
}) ()