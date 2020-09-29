const initOpentok = () => {
  const videosContainer = document.getElementById('videos');

  if (videosContainer) {
    const startCallButton = document.getElementById('start-call');
    const endCallButton = document.getElementById('end-call');
    var timer;

    const opentokApiKey = process.env.OPENTOK_API_KEY;
    const opentokSessionId = videosContainer.dataset.opentokSessionId;
    const opentokToken = videosContainer.dataset.opentokToken;

    // Event listeners
    startCallButton.addEventListener("click", (event) => {
      event.currentTarget.setAttribute("hidden", "");
      videosContainer.removeAttribute("hidden");
      initializeSession();
    });
    endCallButton.addEventListener("mouseover", (event) => {
      event.currentTarget.removeAttribute("hidden");
      clearTimeout(timer);
    });
    endCallButton.addEventListener("click", (event) => {
      event.currentTarget.setAttribute("hidden", "");
      startCallButton.removeAttribute("hidden");
      videosContainer.setAttribute("hidden", "");
      disconnect();
    });
    videosContainer.addEventListener("mousemove", () => {
        endCallButton.removeAttribute("hidden");
        clearTimeout(timer);
        timer = setTimeout(function () {
          endCallButton.setAttribute("hidden", "");
        }, 750);
    });

    // Handling all of our errors here by alerting them
    function handleError(error) {
      if (error) {
        alert(error.message);
      }
    }

    function initializeSession() {
      var session = OT.initSession(opentokApiKey, opentokSessionId);

      // Subscribe to a newly created stream
      session.on('streamCreated', function (event) {
        session.subscribe(event.stream, 'subscriber', {
          insertMode: 'append',
          width: '100%',
          height: '100%'
        }, handleError);
      });

      // Create a publisher
      var publisher = OT.initPublisher('publisher', {
        insertMode: 'append',
        width: '100%',
        height: '100%'
      }, handleError);

      // Connect to the session
      session.connect(opentokToken, function (error) {
        // If the connection is successful, publish to the session
        if (error) {
          handleError(error);
        } else {
          session.publish(publisher, handleError);
          console.log("Connected to the session.");
        }
      });
    }

    function disconnect() {
      var session = OT.initSession(opentokApiKey, opentokSessionId);
      session.disconnect();
      console.log("Disconnected from the session.");
    }
  }
}

export { initOpentok };
