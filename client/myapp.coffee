
Template.web3Info.helpers
  web3Info: -> dapp.web3Info.findOne 'main'
  JSONify: (str) -> JSON.stringify str, null, 2

@messages = new ReactiveVar []

getPosts = ->
  Meteor.call 'SimpleChat.getLastNPosts', (err, data) ->
    messages.set data.reverse()

Template.chatRoom.onCreated -> getPosts()

Template.chatRoom.helpers
  'messages' : -> messages.get()

Template.chatRoom.events
  'click .post-message' : ->
    if message = prompt "Type a message - 32 Chars or less!"
      Meteor.call 'SimpleChat.post', message

  'click .get-posts' : getPosts
