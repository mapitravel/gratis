Meteor.publish 'urls', ->
  URLS.find {}

Meteor.publish 'url',  (id) ->
  id and URLS.find id

Meteor.publish 'comments',  (id) ->
  Comments.find {'urlId': id}

Meteor.publish 'client-urls', ->
  URLS.find({'active': true}, {limit: 10})

Meteor.publish 'cliente',  (id) ->
  id and Clients.find id

Meteor.publish 'myurls', (id) ->
  ClientURLS.find {'clientId': id}

Meteor.publish 'clientes', ->
  Clients.find {}
