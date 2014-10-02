Template.step1.events 'submit .form': (e) ->
  e.preventDefault()
  $check = $ '#agree';
  if !$check.is ':checked'
    FlashMessages.sendError "Tienes que estar de acuerdo con los términos y condiciones"
  else
    $nombres = $ '#nombres'
    $email = $ '#email'
    $pais = $ '#pais'

    Session.set 'nombres', $nombres.val()
    Session.set 'email', $email.val()
    Session.set 'pais', $pais.val()

    Router.go 'step12'

  return