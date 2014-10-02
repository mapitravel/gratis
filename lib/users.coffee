@isLogged = (userId) ->
  user = Meteor.users.findOne userId
  !! user

@isAnon = (userId) ->
  return true