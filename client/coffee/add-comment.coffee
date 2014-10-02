Template.addcomment.events
  'click .btn-primary': (e) ->
    $comment = $ '#comment'
    comments = $comment.val().split('\n')
    comentarios = []
    urlId = (@)._id

    comments.forEach (comment) ->
      if comment != ''
        Comments.insert {'comment': comment, 'active': true, 'urlId': urlId}

    $comment.val ''
    $('#addcomment').modal 'hide'

    FlashMessages.sendSuccess 'Se agregaron más comentarios'
