Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'

filters =
  isLoggedIn: (pause)->
    if !(Meteor.loggingIn() or Meteor.user())
      @render 'forbidden'
      pause()
    return

Router.map ->
  @route 'home', 
    path: '/'

  @route 'step12',
    path: '/12'

  @route 'step2',
    path: '/2'
    waitOn: ->
      Meteor.subscribe 'client-urls'
      Meteor.subscribe 'comments'

  @route 'step3',
    path: '/3'

  @route 'step4',
    path: '/4'

  @route 'addurl',
    path: '/add-url'
    fastRender: true

  @route 'urls',
    path: '/urls'
    waitOn: ->
      Meteor.subscribe 'urls'
    fastRender: true

  @route 'comments',
    path: '/comments/:_id'
    waitOn: ->
      Meteor.subscribe 'url', @params._id
      Meteor.subscribe 'comments', @params._id
    data: ->
      URLS.findOne {_id: @params._id}
    fastRender: true

  @route 'clientes',
    path: '/clientes'
    waitOn: ->
      Meteor.subscribe 'clientes'
    fastRender: true

  @route 'myurls',
    path: '/myurls/:_id'
    waitOn: ->
      Meteor.subscribe 'cliente', @params._id
      Meteor.subscribe 'myurls', @params._id
    data: ->
      Clients.findOne {_id: @params._id}
    fastRender: true

Router.onBeforeAction filters.isLoggedIn,
  only: [
    'comments', 
    'urls', 'addurl', 
    'clientes'
  ]