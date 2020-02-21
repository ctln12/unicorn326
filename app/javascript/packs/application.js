import "bootstrap";
import "bootstrap-select";

//Agora

// rtc object
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
  appID: "de8e59ad20b84deebc9477274c1d3adf",
  channel: "cactus",
  uid: null,
  token:
    "006de8e59ad20b84deebc9477274c1d3adfIADaEJMVSvmx7wkcaHY9OsKeKawoBm739ls9D/QDQl8BCv6333oAAAAAEADaplk0wtBPXgEAAQDC0E9e"
};

// Other functions
// const localStream = document.querySelector("#local_stream");
// localStream.append("<p>Hello</p>");

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
  rtc.client = AgoraRTC.createClient({ mode: "rtc", codec: "h264" });

  // Initialize the client
  rtc.client.init(
    option.appID,
    function() {
      console.log("init success");
      // Join a channel
      rtc.client.join(
        option.token ? option.token : null,
        option.channel,
        option.uid ? +option.uid : null,
        function(uid) {
          console.log(
            "join channel: " + option.channel + " success, uid: " + uid
          );
          rtc.params.uid = uid;
          // Create a local stream
          rtc.localStream = AgoraRTC.createStream({
            streamID: rtc.params.uid,
            audio: true,
            video: true,
            screen: false
          });

          // Initialize the local stream
          rtc.localStream.init(
            function() {
              console.log("init local stream success");
              rtc.localStream.play("local_stream");
              // Publish the local stream
              rtc.client.publish(rtc.localStream, function(err) {
                console.log("publish failed");
                console.error(err);
              });
            },
            function(err) {
              console.error("init local stream failed ", err);
            }
          );
        },
        function(err) {
          console.error("client join failed", err);
        }
      );
    },
    function(err) {
      console.error(err);
    }
  );

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

  rtc.client.on("stream-subscribed", function(evt) {
    var remoteStream = evt.stream;
    var id = remoteStream.getId();
    // Add a view for the remote stream.
    addView(id);
    // Play the remote stream.
    // debugger;
    remoteStream.play("remote_video_" + id);
    console.log("stream-subscribed remote-uid: ", id);
  });

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
    function() {
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
