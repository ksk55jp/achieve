ready = ->
  console.log("ready ignited")
  console.log(location.pathname.split('/').slice(-1)[0] + " << current file name")
  console.log(location.pathname + " << current file name")
  $(window).scroll ->
    threshold=400
    if location.pathname.indexOf("blog") > 0
      console.log("true case in ")
      threshold=200
      console.log("true case out  ")
    console.log("window scroll in")
    element = $('#page-top-btn')
    visible = element.is(':visible')
    height = $(window).scrollTop()
    if height > threshold
      console.log("fadein case true now height is >>" + height)
      element.fadeIn() if !visible
    else
      console.log("fadeout case true now height is >>" + height)
      element.fadeOut()
    console.log("window scroll out")
  $(document).on 'click', '#move-page-top', ->
    console.log("click event in ")
    $('html, body').animate({ scrollTop: 0}, 'slow')
    console.log("hello")
  console.log("ready finished")

$(document).ready(ready)
$(document).on('page:load', ready)
console.log("scrollTop out")


