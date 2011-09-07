$ ->
  if $('.thanks-index-page').is(':visible')
    
    $('.thanks li')
      .bind('mouseover', (e)->
        $(this).find('.destroy').show()
      )
      .bind('mouseout', (e)->
        $(this).find('.destroy').hide()
      )
    
    $('.btn-destroy')
      .bind('click', (e)->
        parent = $(this).parents('li')
        parent.fadeOut()
        $.ajax
          url: "/thanks/#{parent.data('thank-id')}"
          type: 'DELETE'
      )