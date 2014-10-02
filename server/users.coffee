if Meteor.users.find({}).count() == 0
  user =
    'username': 'admin'
    'password': 'mapitravel'

  Accounts.createUser user
