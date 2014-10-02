Template.step3.created = ->
  if Session.equals('filled', undefined)
    Router.go 'step2'

Template.step3.helpers
  peru: ->
    Session.equals('pais', 'pe')

Template.step3.events 'submit .form': (e) ->
  e.preventDefault()
  $numero = $ '#numero'
  $ciudad = $ '#ciudad'
  $operador = $ '#operador'

  redes = []
  if !Session.equals('fb', undefined)
    redes.push 'Facebook'

  if !Session.equals('gp', undefined)
    redes.push 'Google+'

  data =
    'nombres': Session.get('nombres')
    'email': Session.get('email')
    'pais': Session.get('pais')
    'numero': $numero.val()
    'ciudad': $ciudad.val()
    'operador': $operador.val()
    'recarga': false
    'redes': redes

  _id = Clients.insert(data)

  urls = _.clone Session.get('urls')

  urls.forEach (u) ->
    udata = 
      'url': u
      'clientId': _id

    ClientURLS.insert udata

  if(_id)
    Session.keys = {}
    Router.go 'step4'
  else
    FlashMessages.sendError 'Hubo un problema al guardar los datos'

  return