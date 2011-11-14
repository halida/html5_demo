rotateCss = (name, deg)->
  object = $(name)
  degname = 'rotate(' + deg + 'deg)'
  object.css('-moz-transform', degname)
  object.css('-webkit-transform', degname)
  object.css('-o-transform', degname)
  object.css('-ms-transform', degname)
  object.css('transform', degname)

update = ()->
  dTime = new Date()
  hours = dTime.getHours()
  mins = dTime.getMinutes()
  secs = dTime.getSeconds()

  rotateCss('#sec-pointer', 360 * secs / 60)
  rotateCss('#min-pointer', 360 * mins / 60)
  rotateCss('#hour-pointer', 360 * hours / 12)

loopUpdate = ()->
  update()
  setTimeout(loopUpdate, 1000)

window.clock_init = ()->
  loopUpdate()


