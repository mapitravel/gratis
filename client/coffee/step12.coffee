Template.step12.events
  'click .next': (e) ->
    $chk = $("input[type='checkbox']")
    if $chk.is ':checked'
      if $('#fb').is(':checked')
        Session.set('fb', true)
      if $('#gp').is(':checked')
        Session.set('gp', true)

      Session.set('redes', true)
      Session.set('urls', [])
      Router.go 'step2'
    else
      FlashMessages.sendError 'Escoge al menos una Red Social.'


Template.step12.created = ->
  if Session.equals('nombres', undefined)
    Router.go 'home'
