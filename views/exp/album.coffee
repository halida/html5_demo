bar_state = false

current_seq = 0
count = 0

round = (current, c, count)->
        (current + c + count) % count

flip = (c)->
        current_seq = round current_seq, c, count
        update_flip()

update_flip = ->
        src = $($('.images img')[current_seq]).attr('src')
        $('.current-display-img').attr('src', src)
        $('#left').html(round current_seq, -1, count)
        $('#right').html(round current_seq, 1, count)

window.toggle = ->
        bar_state = not bar_state
        if bar_state
                $('#board').css('height', "10%")
                $('#left, #right, #displayer').hide()
        else
                $('#board').css('height', "90%")
                $('#left, #right, #displayer').show(500)

window.init = ->
        scr = $('#screen')
        scr.css('width', $(window).width() + 'px')
        scr.css('height', ($(window).height()-1) + 'px')

        $('#bar').live "click", toggle

        $('#left').live "click", -> flip(-1)
        $('#right').live "click", -> flip(1)

        count = $('.images img').length

        update_flip()

$ -> init()