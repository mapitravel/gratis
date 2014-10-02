Template.clientes.helpers
  clientes: ->
    Clients.find {}

Template.clientes.events
  'click .btn-success': (e) ->
    Clients.update (@)._id,
      $set: 
        'recarga': true

  'click .btn-info': (e) ->
    Clients.remove (@)._id
    ClientURLS.remove {'clientId': (@)._id}

    FlashMessages.sendWarning 'Borraste a un cliente'
