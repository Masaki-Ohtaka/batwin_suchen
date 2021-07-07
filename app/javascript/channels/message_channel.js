import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // console.log(data);
    const html = `<li class="comments_list">${data.content.text}<a class="comment_user" href="/">（${data.content.user_name} ）</a></li>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('comment_text');
    messages.insertAdjacentHTML('afterbegin', html);

    newMessage.value='';
  }
});
