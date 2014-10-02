Template.myurls.helpers
  urls: ->
    Meteor.subscribe 'myurls', (@)._id
    ClientURLS.find {'clientId': (@)._id}
  url: ->
    Meteor.subscribe 'url', (@).url
    URLS.findOne {'_id': (@).url}
 