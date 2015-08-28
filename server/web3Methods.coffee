# TODO Listen to blockchain for tx updates
# TODO a better filter and rate limiting
# eg. web3.eth.filter 'pending', Meteor.bindEnvironment ->

# For now, we'll just do polling
Meteor.setInterval ->
  # if there is an update, update mongo collection with new status
  dapp.web3Info.upsert 'main',
    balance : web3.eth.getBalance(web3.eth.coinbase)
    coinbase : String(web3.eth.coinbase).substr 0, 9
    gasPrice : web3.eth.gasPrice
    blockNumber : web3.eth.blockNumber
    mining : web3.eth.mining
    lastUpdated : new Date()
, 5000

# expose set/get methods to client
Meteor.methods
  "SimpleChat.post" : (message) -> SimpleChat.post(message)

  "SimpleChat.getPost" : (n) -> SimpleChat.getPost(n)

  "SimpleChat.getPostCount" : -> SimpleChat.getPostCount().toNumber()

  # not actually part of the web3 client, but I can do the processing here
  "SimpleChat.getLastNPosts" : (n=0) ->
    totalPosts = SimpleChat.getPostCount().toNumber()
    if n < 1 or n > totalPosts
      n = totalPosts
    posts = []
    for i in range = [totalPosts-n...totalPosts]
      posts[i] = SimpleChat.getPost i

    return posts