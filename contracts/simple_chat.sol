contract SimpleChat {

  uint numMessages;

  mapping (uint => string) chatLog;

  function post(string x) {
    chatLog[numMessages++] = x;
  }

  function getPost(uint n) constant returns (string out) {
    return chatLog[n];
  }

  function getPostCount() constant returns (uint out) {
    return numMessages;
  }

}
