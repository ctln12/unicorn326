const initOpentok = () => {
  const videosContainer = document.getElementById("videos");

  const connectToSession = (token) => {
    session.on({
      connectionCreated: function (event) {
        connectionCount++;
        console.log(connectionCount + ' connections.');
      },
      connectionDestroyed: function (event) {
        connectionCount--;
        console.log(connectionCount + ' connections.');
      },
      sessionDisconnected: function sessionDisconnectHandler(event) {
        console.log('Disconnected from the session.');
        document.getElementById('disconnectBtn').style.display = 'none';
        if (event.reason == 'networkDisconnected') {
          alert('Your network connection terminated.')
        }
      },
      streamCreated: function(event) {
        console.log("New stream in the session: " + event.stream.streamId);
        var subscriber;
        console.log("Video type: ", event.stream.videoType);
        if (event.stream.videoType === 'screen') {
          subscriber = session.subscribe(
            event.stream,
            'screen-preview',
            {
              insertMode: 'append',
              width: "100%",
              height: "100%"
            }, function (error) {
            if (error) {
              console.log("Error: ", error);
            } else {
              console.log('Subscriber to screen-sharing added.');
              const subscriberContainer = document.getElementById("subscriber");
              const screenPreviewContainer = document.getElementById("screen-preview");
              if (screenPreviewContainer.children[0].classList.contains("OT_subscriber")) {
                subscriberContainer.classList.add("subscriber-small");
                console.log("Show subscriber in small window.");
              }
            }
          });
        } else {
          subscriber = session.subscribe(
            event.stream,
            'subscriber',
            {
              insertMode: 'append',
              width: "100%",
              height: "100%"
            }, function (error) {
            if (error) {
              console.log("Error: ", error);
            } else {
              console.log('Subscriber to video stream added.');
            }
          });
        }
        subscriber.setStyle({ buttonDisplayMode: 'off' });
      },
      streamDestroyed: function(event) {
        console.log("Stream destroyed. Reason: ", event.reason);
        const subscriberContainer = document.getElementById("subscriber");
          subscriberContainer.classList.remove("subscriber-small");
          console.log("Show subscriber in big window.");
      },
      archiveStarted: function archiveStarted(event) {
        archiveID = event.id;
        console.log('Archive started ' + archiveID);
      },
      archiveStopped: function archiveStopped(event) {
        archiveID = event.id;
        console.log('Archive stopped ' + archiveID);
      }
    });
    publisher = OT.initPublisher(
      'publisher',
      {
        style: { buttonDisplayMode: 'off' },
        insertMode: 'append',
        width: "100%",
        height: "100%"
      });
    publisher.on({
      streamCreated: function (event) {
        console.log("Publisher started streaming.");
        muteButton.addEventListener("click", () => {
          if (publisher.stream.hasAudio) {
            publisher.publishAudio(false);
            muteButton.innerHTML = "<i class='fas fa-microphone'></i>";
            console.log("Audio off");
          } else {
            publisher.publishAudio(true);
            muteButton.innerHTML = "<i class='fas fa-microphone-slash'></i>";
            console.log("Audio on");
          }
        });
        hideVideoButton.addEventListener("click", () => {
          if (publisher.stream.hasVideo) {
            publisher.publishVideo(false);
            hideVideoButton.innerHTML = "<i class='fas fa-video'></i>";
            console.log("Video off");
          } else {
            publisher.publishVideo(true);
            hideVideoButton.innerHTML = "<i class='fas fa-video-slash'></i>";
            console.log("Video on");
          }
        });
      },
      streamDestroyed: function (event) {
        console.log("Publisher stopped streaming. Reason: "
          + event.reason);
      }
    });
    session.connect(token, function (error) {
      if (error) {
        console.log("Error connecting: ", error.name, error.message);
      } else {
        console.log("Connected to the session.");
        session.publish(publisher);
      }
    });
  };

  const stopPublishing = () => {
    session.unpublish(publisher);
  };

  const screenSharing = () => {
    OT.checkScreenSharingCapability(function (response) {
      if (!response.supported || response.extensionRegistered === false) {
        alert("This browser does not support screen sharing.");
      } else if (response.extensionInstalled === false) {
        alert("Please install the extension.");
      } else {
        screenSharingPublisher = OT.initPublisher(
          'screen-preview',
          {
            videoSource: 'screen',
            insertMode: 'append',
            width: 360,
            height: 240
          },function (error) {
            if (error) {
              console.log("Error: ", error.message);
            } else {
              session.publish(screenSharingPublisher, function (error) {
                if (error) {
                  console.log("Error: ", error.message);
                } else {
                  console.log("Screen-sharing published.");
                }
              });
            }
          }
        );
        screenSharingPublisher.on('mediaStopped', function (event) {
          console.log("Screen-sharing stopped.");
        });
      }
    });
  };

  const startArchive = (opentokSessionID) => {
    fetch(`${baseUrl}/archive/start`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ 'sessionId': opentokSessionID })
    })
    .then(response => response.json())
    .then((data) => {
      console.log("Recording started...");
      console.log(data);
    });
  }

  const stopArchive = (archiveID) => {
    // $.post(SAMPLE_SERVER_BASE_URL + '/archive/' + archiveID + '/stop');
    fetch(`${baseUrl}/archive/${archiveID}/stop`, { method: "POST" })
    .then(response => response.json())
    .then((data) => {
      console.log("Recording stopped");
      console.log(data);
    });
  }

  if (videosContainer) {
    const callButtonsContainer = document.getElementById("call-buttons");
    const startCallButton = document.getElementById("start-call");
    const endCallButton = document.getElementById("end-call");
    const screenSharingButton = document.getElementById("screen-sharing");

    const opentokApiKey = process.env.OPENTOK_API_KEY;
    const opentokSessionID = videosContainer.dataset.opentokSessionId;
    const opentokToken = videosContainer.dataset.opentokToken; // one per person

    var session = OT.initSession(opentokApiKey, opentokSessionID); // one per lesson
    console.log("Session ID: ", session.id);
    var connectionCount = 0;
    var publisher;
    var screenSharingPublisher;
    var timer;
    var muteButton = document.getElementById("mute");
    var hideVideoButton = document.getElementById("hide-video");

    var baseUrl = process.env.BASE_URL;
    var archiveID;

    videosContainer.addEventListener("mousemove", () => {
      callButtonsContainer.removeAttribute("hidden");
      clearTimeout(timer);
      timer = setTimeout(function () {
        callButtonsContainer.setAttribute("hidden", "");
      }, 750);
    });
    callButtonsContainer.addEventListener("mouseover", (event) => {
      event.currentTarget.removeAttribute("hidden");
      clearTimeout(timer);
    });
    startCallButton.addEventListener("click", (event) => {
      event.currentTarget.setAttribute("hidden", "");
      videosContainer.removeAttribute("hidden");
      connectToSession(opentokToken);
      startArchive(opentokSessionID);
    });
    endCallButton.addEventListener("click", (event) => {
      callButtonsContainer.setAttribute("hidden", "");
      videosContainer.setAttribute("hidden", "");
      stopPublishing();
      stopArchive(archiveID);
    });
    screenSharingButton.addEventListener("click", (event) => {
      screenSharing();
    });
  }
};

export { initOpentok };
