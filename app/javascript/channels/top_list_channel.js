import consumer from "./consumer"

consumer.subscriptions.create("TopListChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const topListElement= document.querySelector('div.top_list')
    if (topListElement){
      topListElement.innerHTML=data.html
    }
  }
});
