appendData = ()->
  for num in [1..10]
    $('#wall-inner').append($('#bak').html())

window.wall_init = ()->
  $('.more').appear ()->
    setTimeout(appendData, 1000)
