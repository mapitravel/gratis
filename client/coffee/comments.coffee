Template.comments.helpers
  comments: ->
    Meteor.subscribe 'comments', (@)._id
    Comments.find {'urlId': (@)._id}

Template.comments.events
  'click .btn-danger': (e) ->
    Comments.update (@)._id,
      $set: 
        'active': false

  'click .btn-success': (e) ->
    Comments.update (@)._id,
      $set: 
        'active': true

  'click .btn-info': (e) ->
    Comments.remove (@)._id
    FlashMessages.sendWarning 'Borraste un comentario'
