Template.urls.helpers
  urls: ->
    URLS.find {}
  num: ->
    Meteor.subscribe 'comments', (@)._id
    Comments.find({'urlId': (@)._id, 'active': true}).count()


Template.urls.events
  'click .btn-danger': (e) ->
    URLS.update (@)._id,
      $set: 
        'active': false

  'click .btn-success': (e) ->
    URLS.update (@)._id,
      $set: 
        'active': true

  'click .btn-info': (e) ->
    URLS.remove (@)._id
    FlashMessages.sendWarning 'Borraste una URL'
