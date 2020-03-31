const messagesContainer = document.getElementById('chat-messages');

const chatRecipientIsStudent = messagesContainer.dataset.chatRecipientIsStudent;
const chatRecipientId = messagesContainer.dataset.chatRecipientId;

const getLastMessage = () => {
  const messages = document.querySelectorAll('.chat-message');
  const size = messages.length;
  console.log(size);
  return messages[size - 1];
}

const scrollMessages = () => {
  const lastMessage = getLastMessage();
  if (lastMessage) {
    lastMessage.scrollIntoView({ behavior: "smooth", block: "end" });
  }
}

const removeAuthorClasses = (lastMessage, lastMessageContent, lastMessageContentText, lastMessageContentDate) => {
  lastMessage.classList.remove('right');
  lastMessageContent.classList.remove('reverse');
  lastMessageContentText.classList.remove('bg-style');
  lastMessageContentDate.classList.remove('indent');
}

scrollMessages();

if (messagesContainer) {
  const id = messagesContainer.dataset.chatId;

  App.cable.subscriptions.create({ channel: "ChatChannel", id: id}, {
    received(data) {
      const lastMessage = jQuery.parseHTML(data)[0];
      const lastMessageContent = lastMessage.children[0];
      const lastMessageContentText = lastMessage.children[0].children[1];
      const lastMessageContentDate = lastMessage.children[1].children[0];

      const messageAuthorIsStudent = lastMessage.dataset.messageAuthorIsStudent;
      const messageAuthorId = lastMessage.dataset.messageAuthorId;

      if (chatRecipientIsStudent === messageAuthorIsStudent && chatRecipientId === messageAuthorId) {
        removeAuthorClasses(lastMessage, lastMessageContent, lastMessageContentText, lastMessageContentDate);
      }

      messagesContainer.insertAdjacentElement('beforeend', lastMessage);

      scrollMessages();

      const newMessageInput = document.querySelector('#chat-new-message-input');
      newMessageInput.value = '';

      const chatNewMessageButton = document.querySelector('#chat-new-message-button');
      chatNewMessageButton.removeAttribute('disabled');
    }
  });
}
