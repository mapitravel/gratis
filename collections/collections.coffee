@URLS = new Meteor.Collection 'urls'
@Clients = new Meteor.Collection 'clientes'
@Comments = new Meteor.Collection 'comments'
@ClientURLS = new Meteor.Collection 'clienturls'

URLS.allow
  insert: isLogged
  update: isLogged
  remove: isLogged

Comments.allow
  insert: isLogged
  update: isLogged
  remove: isLogged

Clients.allow
  insert: isAnon
  update: isLogged
  remove: isLogged

ClientURLS.allow
  insert: isAnon
  update: isLogged
  remove: isLogged
