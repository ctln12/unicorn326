// ----------------- AGORA -----------------

// RTC Object
var rtc = {
  client: null,
  joined: false,
  published: false,
  localStream: null,
  remoteStreams: [],
  params: {}
};

// Options for joining a channel
var option = {
  appID: "23eafc68667e4d9b893d739712dfafb4",
  channel: "lesson",
  uid: null,
  token:
    "00623eafc68667e4d9b893d739712dfafb4IACoTjKDaVSyNVyVf2ybSvDO8Aere74M5fiOobRxMzh8bfN0dPgAAAAAEABULH+Eoj1aXgEAAQChPVpe"
};

// Additional functions
// const addView = id => {
//   console.log("VIEW ADDED");
// };

// const removeView = id => {
//   console.log("VIEW REMOVED");
// };
function addView(id, show) {
  if (!$("#" + id)[0]) {
    $("<div/>", {
      id: "remote_video_panel_" + id
      // class: "video-view"
    }).appendTo("#video");

    $("<div/>", {
      id: "remote_video_" + id
      // class: "video-placeholder"
    }).appendTo("#remote_video_panel_" + id);

    $("<div/>", {
      id: "remote_video_info_" + id
      // class: "video-profile " + (show ? "" : "hide")
    }).appendTo("#remote_video_panel_" + id);

    $("<div/>", {
      id: "video_autoplay_" + id
      // class: "autoplay-fallback hide"
    }).appendTo("#remote_video_panel_" + id);
  }
}

function removeView(id) {
  if ($("#remote_video_panel_" + id)[0]) {
    $("#remote_video_panel_" + id).remove();
  }
}

// Helper functions to handle DOM operations
document.querySelector("#join").onclick = () => {
  // Create a client
  rtc.client = AgoraRTC.createClient({
    mode: "rtc",
    codec: "h264" // encoding
  });

  // Initialize the client
  rtc.client.init(
    option.appID,
    () => {
      console.log("init success");

      // Join a channel
      rtc.client.join(
        option.token ? option.token : null,
        option.channel,
        option.uid ? +option.uid : null,
        uid => {
          console.log(
            "join channel: " + option.channel + " success, uid: " + uid
          );
          rtc.params.uid = uid;

          // Create a local stream
          rtc.localStream = AgoraRTC.createStream({
            streamID: rtc.params.uid,
            audio: true,
            video: true,
            screen: false // screen sharing
          });

          // Initialize the local stream
          rtc.localStream.init(
            () => {
              console.log("init local stream success");
              // PLAY ???
              rtc.localStream.play("local_stream"); // HTMLElementID
              // Publish the local stream
              rtc.client.publish(rtc.localStream, err => {
                console.log("publish failed");
                console.error(err);
              });
            },
            err => {
              console.error("init local stream failed ", err);
            }
          );
        },
        err => {
          console.error("client join failed", err);
        }
      );
    },
    err => {
      console.error(err);
    }
  );

  // Subscribe to a remote stream
  rtc.client.on("stream-added", function(evt) {
    var remoteStream = evt.stream;
    var id = remoteStream.getId();
    if (id !== rtc.params.uid) {
      rtc.client.subscribe(remoteStream, function(err) {
        console.log("stream subscribe failed", err);
      });
    }
    console.log("stream-added remote-uid: ", id);
  });

  // Play remote stream after subscribing
  rtc.client.on("stream-subscribed", function(evt) {
    var remoteStream = evt.stream;
    var id = remoteStream.getId();
    // Add a view for the remote stream.
    addView(id);
    // Play the remote stream.
    remoteStream.play("remote_video_" + id);
    console.log("stream-subscribed remote-uid: ", id);
  });

  // Stop stream playback and remove view
  rtc.client.on("stream-removed", function(evt) {
    var remoteStream = evt.stream;
    var id = remoteStream.getId();
    // Stop playing the remote stream.
    remoteStream.stop("remote_video_" + id);
    // Remove the view of the remote stream.
    removeView(id);
    console.log("stream-removed remote-uid: ", id);
  });
};

document.querySelector("#leave").onclick = () => {
  // Leave the channel
  rtc.client.leave(
    () => {
      // Stop playing the local stream
      rtc.localStream.stop();
      // Close the local stream
      rtc.localStream.close();
      // Stop playing the remote streams and remove the views
      while (rtc.remoteStreams.length > 0) {
        var stream = rtc.remoteStreams.shift();
        var id = stream.getId();
        stream.stop();
        removeView(id);
      }
      console.log("client leaves channel success");
    },
    function(err) {
      console.log("channel leave failed");
      console.error(err);
    }
  );
};
