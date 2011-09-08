$ ->
  if $('.thanks-new-page').is(':visible')
    
    # 入力フォーム監視
    observeInputs = (e)->
      values = $('#thank_what,#thank_message').map (index,node)-> $(node).val()
      if _.all(values, (value)-> value != '')
        $('input[name=commit]').removeAttr('disabled')
      else
        $('input[name=commit]').attr('disabled','disabled')
    observeInputs()
    $('#thank_what,#thank_message')
      .bind('keyup', observeInputs)
      .bind('change', observeInputs)
    
  
  if $('.thanks-index-page').is(':visible')
    
    $('.thanks li')
      .bind('mouseover', (e)->
        $(this).find('.destroy').show()
      )
      .bind('mouseout', (e)->
        $(this).find('.destroy').hide()
      )
    
    updateSystemMessage = (thanksNode)->
      count = $(thanksNode).find('li:visible').size()
      $(thanksNode).find('.system-message p').hide()
      if count == 0
        $(thanksNode).find('.empty-thanks-message').show()
      else if count >= 5
        $(thanksNode).find('.full-thanks-message').show()
      else
        $(thanksNode).find('.notyet-thanks-message').show()
        $(thanksNode).find('.notyet-thanks-message .num').text(5 - count)
    
    $('dd.thanks').each((i,node)->updateSystemMessage($(node)))
    
    # Thank 削除
    $('.btn-destroy')
      .bind('ajax:success',(e,res,status)->
        console.log(res)
        if status == 'success'
          thank = $(this).parents('li')
          thank.fadeOut(1000, ()->
            date = thank.parents('dd').data('date')
            count = $("dd[data-date=#{date}] li:visible").size()
            $("dt[data-date=#{date}]").find('.num').text(count)
            updateSystemMessage($("dd[data-date=#{date}]"))
          )
      )
