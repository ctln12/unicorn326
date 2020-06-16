const initOpenTok = () => {
  const videosContainer = document.getElementById('videos');

  if (videosContainer) {
    console.log("Hello from OpenTok!");
    // replace these values with those generated in your TokBox Account
    var apiKey = process.env.OPENTOK_API_KEY;
    console.log(apiKey);
    var opentokData = videosContainer.dataset;
    var sessionId = opentokData.sessionId;
    console.log(sessionId);
    var token = opentokData.token;
    console.log(token);

    // (optional) add server code here
    initializeSession();

    // Handling all of our errors here by alerting them
    function handleError(error) {
      if (error) {
        alert(error.message);
      }
    }

    function initializeSession() {
      var session = OT.initSession(apiKey, sessionId);

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
      session.connect(token, function (error) {
        // If the connection is successful, publish to the session
        if (error) {
          handleError(error);
        } else {
          session.publish(publisher, handleError);
        }
      });
    }
  }
}

export { initOpenTok };
