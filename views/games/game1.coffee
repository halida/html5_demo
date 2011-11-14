FPS = 30
x = 0
y = 0
xDirection = 1
yDirection = 1
image = new Image()
image.src = "http://javascript-tutorials.googlecode.com/files/jsplatformer1-smiley.jpg"
canvas = null
context2D = null

window.onload = ()->
  canvas = document.getElementById('canvas')
  context2D = canvas.getContext('2d')
  setInterval(draw, 1000 / FPS)

draw = ()->
  context2D.clearRect(0, 0, canvas.width, canvas.height)
  context2D.drawImage(image, x, y)
  x += 1 * xDirection
  y += 1 * yDirection
    
  if (x >= 450)
    x = 450
    xDirection = -1
  else if (x <= 0)
    x = 0
    xDirection = 1
    
  if (y >= 250)
    y = 250
    yDirection = -1
  else if (y <= 0)
    y = 0
    yDirection = 1
