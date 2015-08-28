# meteor-server-dapp-chatroom
### A demo of embark + meteor + server-side web3 client

This is a [Meteor](http://github.com/meteor/meteor) distrtibuted app (dapp) that uses [Embark](https://github.com/iurimatias/embark-framework), which uses [Ethereum](https://www.ethereum.org/).

The point of this app was for experimentaiton (my first dapp), and as a **proof of concept alternative to client-only embark apps**.

By interacting with the blockchain on the server (still using web3), we can deploy to the regular internet and allow users to interact with Daps without having to run a geth client themselves; in some cases a potentially more convenient semi-distributed architecture.

---

To install, make sure you have [Embark](https://github.com/iurimatias/embark-framework) installed.

```
npm install -g embark-framework grunt-cli;
```

Then clone this repo somewhere, `cd` to it, then run:

```
embark blockchain;
```

In another window `cd` to ther same folder and run:

```
embark deploy;
```

You may need to wait a few seconds first to mine some blocks. Keep trying until you see `deployed SimpleChat at 0x...`.

Then start the server:

```
meteor;
```

You'll be able to play with the app at `localhost:3000`.

---

MIT 2015
