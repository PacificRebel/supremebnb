(function() {
  window.addEventListener('load', function() {
    var dateOfStay = $('#date-of-stay')
    var submitDate = $('#submit-date')
    var content = $('#content')
    var url = '/spaces'
    content.load(url)
    console.log('yo')
  })
}) ()