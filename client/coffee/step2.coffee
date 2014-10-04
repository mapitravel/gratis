Template.step2.helpers
  urls: ->
    rand = Math.random()
    urls = URLS.find {'random': {$lte: rand}, 'active': true}
    $('#c').val(urls.count())
    urls

  comments: ->
    Meteor.subscribe 'comments', (@)._id
    Comments.find {'urlId': (@)._id}

  fb: ->
    Session.equals('fb', true)

  gp: ->
    Session.equals('gp', true)

  url: ->
    encodeURIComponent (@).url

  domain: ->
    l = document.createElement 'a'
    l.href = (@).url
    l.hostname

  protocol: ->
    l = document.createElement 'a'
    l.href = (@).url
    l.protocol


Template.step2.events
  'click .btn-success': (e) ->
    Comments.update (@)._id,
      $set: 
        'active': false

    urls = _.clone Session.get('urls')
    urls.push (@).urlId
    Session.set('urls', urls)

    Meteor.subscribe 'comments', (@).urlId
    numComments = Comments.find({'urlId': (@).urlId, 'active': true}).count()
    if numComments == 0
      URLS.update (@).urlId,
        $set: 
          'active': false

    parent = $(e.target).data 'parent'
    $parent = $ '[data-id=' + parent + ']'
    
    $parent.addClass 'animated fadeOutUp'
    
    $parent.bind 'webkitAnimationEnd', ->
      $parent.remove()
    
    $parent.bind 'animationend', ->
      $parent.remove()

    c = $('#c').val()
    c--
    $('#c').val(c)
    if c == 0
      FlashMessages.sendSuccess '¡Muy bien! continua con el siguiente paso :)'
      $('.next').removeAttr('disabled')

  'click .next': (e) ->
    Session.set('filled', true)
    Router.go 'step3'

Template.step2.created = ->
  if Session.equals('redes', undefined)
    Router.go 'step12'