
autoScale = ->
    $('body').height $(window).height()


$(window).resize autoScale

autoScale()


scaleWhenPress = (elms) ->
    for elm in elms
        $e = $(elm)
        $e.mousedown ->
            $(this).addClass 'pressed'
            
        $e.on 'touchstart', ->
            $(this).addClass 'pressed'
            
        $e.mouseup ->
            $(this).removeClass 'pressed'

        $e.mouseleave ->
            $(this).removeClass 'pressed'

        $e.on 'touchend', ->
            $(this).removeClass 'pressed'


scaleWhenPress ['.answer', '.next']


class Quiz
    constructor: (@questions) ->
        @index = 0
        @length = @questions.length
        @errors = 0

        $('.answer').mousedown @submit
        $('.answer').on 'touchend', @submit

        $('.next').click @next

        @show()

    show: ->
        score = Math.round( (@index - @errors) * 10000 / @index ) / 100
        score = 100 if _.isNaN(score)

        $('.index').text "#{@index+1} / #{@length} (#{score}%)"

        $('.process').css('width', @index * $('.container').width() / @length )

        q = @questions[@index]

        $('.question').html( q.eg.replace q.word, '<span class="word">'+q.word+'</span>' )

        answers = _.shuffle [{result: 'right', desc: q.desc}, {result: 'wrong', desc: q.wrong}]
        _.each answers, (e, i) ->
            $('.answer').eq(i).data('result', e.result).find('span').text(e.desc)

        $('.next').hide()
        @submited = false


    submit: (e) =>
        if not @submited
            @submited = true

            $e = $(e.currentTarget)

            if $e.data('result') is 'right'
                $('.result i', $e).addClass 'icon-ok'
                setTimeout @next, 400
            else
                @errors += 1
                $('.result i', $e).addClass 'icon-remove'
                $('.next').show()

    next: =>
        @index += 1
        $('.answers .result i').removeClass()
        @show()

$ ->
    $.getJSON 'static/Barron 3500 eg.json', (json) ->

        answers = _.shuffle(json)

        _.each json, (e, i) ->
            e.wrong = answers[i].desc

        questions = _.shuffle(json)

        quiz = new Quiz questions
        
        $('.container').show()
