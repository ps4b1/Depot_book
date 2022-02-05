import consumer from "./consumer"

consumer.subscriptions.create("ProductsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },
//radi ali ne mogu imati dva istovremeno na ovaj način
  received(data) {
    // const topListElement = document.querySelector("div.top_list")
    const storeElement = document.querySelector("main.store")
    if (storeElement) {
      storeElement.innerHTML = data.html

    }
    // if(topListElement) {
    //   topListElement.innerHTML= data.html
    // }
  }
});
