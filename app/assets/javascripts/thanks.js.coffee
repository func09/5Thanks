$ ->
  if $('.thanks-index-page').is(':visible')
    
    $('.thanks li')
      .bind('mouseover', (e)->
        $(this).find('.destroy').show()
      )
      .bind('mouseout', (e)->
        $(this).find('.destroy').hide()
      )
    
    # # Thank Create
    # $('form#new_thank')
    #   .bind('submit', (e)-> 
    #     $('#thank_what').val('')
    #     $('#thank_message').val('')
    #   )
    #   .bind('ajax:complete', (e, response, status)->
    #     console.log(e)
    #     console.log(response)
    #     console.log(data)
    #   )
    # 
    # # 入力フォーム監視
    # observeInputs = (e)->
    #   values = $('#thank_what,#thank_message').map (index,node)-> $(node).val()
    #   if _.all(values, (value)-> value != '')
    #     $('input[name=commit]').removeAttr('disabled')
    #   else
    #     $('input[name=commit]').attr('disabled','disabled')
    # observeInputs()
    # $('#thank_what,#thank_message')
    #   .bind('keyup', observeInputs)
    #   .bind('change', observeInputs)
    
    # Thank 削除
    $('.btn-destroy')
      .bind('click', (e)->
        e.preventDefault()
        parent = $(this).parents('li')
        parent.fadeOut()
        $.ajax
          url: "/thanks/#{parent.data('thank-id')}"
          type: 'DELETE'
      )