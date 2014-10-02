Template.addurl.events
  'submit .form': (e) ->
    e.preventDefault()

    data =
      'url': $('#url').val()
      'active': true
      'random': Math.random()

    _id = URLS.insert(data)

    if(_id)
      $comment = $ '#comment'
      comments = $comment.val().split('\n')
      comentarios = []
      comments.forEach (comment) ->
        if comment != ''
          Comments.insert {'comment': comment, 'active': true, 'urlId': _id}

      FlashMessages.sendSuccess 'Se creó la URL con sus comentarios'
      Router.go 'urls'
    else
      FlashMessages.sendError 'Hubo un problema al crear la URL'

  'click .other': (e) ->
    if $('#url').val() == ''
      FlashMessages.sendError 'Ingresa la URL'
      return
    else
      data =
        'url': $('#url').val()
        'active': true
        'random': Math.random()

      _id = URLS.insert(data)

      if(_id)
        $comment = $ '#comment'
        comments = $comment.val().split('\n')
        comentarios = []
        comments.forEach (comment) ->
          if comment != ''
            Comments.insert {'comment': comment, 'active': true, 'urlId': _id}

        FlashMessages.sendSuccess 'Se creó la URL con sus comentarios'
        $('#url').val('').focus()
        $('#comment').val ''

      else
        FlashMessages.sendError 'Hubo un problema al crear la URL'
