$(function() {
  $('[data-channel-subscribe="chat"]').each(function(index, element) {
    var $element = $(element),
      chat_id = $element.data("chat-id");
    messageTemplate = $('[data-role="message-template"]');

    $element.animate({ scrollTop: $element.prop("scrollHeight") }, 1000);

    App.cable.subscriptions.create(
      {
        channel: "ChatChannel",
        chat: chat_id
      },
      {
        received: function(data) {
          var content = messageTemplate.children().clone(true, true);
          content
            .find('[data-role="user-avatar"]')
            .attr("src", data.user_avatar_url);
          content.find('[data-role="message-text"]').text(data.content);
          var timeNow = new Date(data.updated_at);
          var addZero = function(nb) {
            if (nb < 10) {
              return `0${nb}`;
            } else {
              return nb;
            }
          }
          var timeNowStyled = `${addZero(timeNow.getHours())}:${addZero(timeNow.getMinutes())}`
          content.find('[data-role="message-date"]').text(timeNowStyled);
          $element.append(content);
          $element.animate({ scrollTop: $element.prop("scrollHeight") }, 1000);
        }
      }
    );
  });
});
