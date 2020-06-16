const initOpenTok = () => {
  const videosContainer = document.getElementById('videos');

  if (videosContainer) {
    console.log("Hello from OpenTok!");
    // replace these values with those generated in your TokBox Account
    var apiKey = "46794434";
    var sessionId = "2_MX40Njc5NDQzNH5-MTU5MjMwMjkwMDIyN35IQmdGKzZkaFpIWDVPS2tYRFBiaGN5di9-fg";
    var token = "T1==cGFydG5lcl9pZD00Njc5NDQzNCZzaWc9NWM3NDU0YTQzZWQwNGE0ODg4YWI1OTY4YjQ5NzBhNjNiZGVlZWRjOTpzZXNzaW9uX2lkPTJfTVg0ME5qYzVORFF6Tkg1LU1UVTVNak13TWprd01ESXlOMzVJUW1kR0t6WmthRnBJV0RWUFMydFlSRkJpYUdONWRpOS1mZyZjcmVhdGVfdGltZT0xNTkyMzEzOTA0Jm5vbmNlPTAuNzI4MTg1MzAyMDI2ODM1JnJvbGU9cHVibGlzaGVyJmV4cGlyZV90aW1lPTE1OTIzMTc1MDMmaW5pdGlhbF9sYXlvdXRfY2xhc3NfbGlzdD0=";

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
