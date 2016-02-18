/* YouTube Player API */
var videoid;
function createYouTubeAPI(vid) {
	videoid=vid;
	//2. This code loads the IFrame Player API code asynchronously.
	var tag = document.createElement('script');
	
	tag.src = "https://www.youtube.com/iframe_api";
	var firstScriptTag = document.getElementsByTagName('script')[0];
	firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
}

// 3. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player;
function onYouTubeIframeAPIReady() {
  player = new YT.Player('player', {
    width: '100%',
    height: '100%',
    videoId: videoid, //'fFZwgPcW7FM',
    playerVars: {
		autoplay: 1,
		controls: 0,
		loop: 1,
		rel: 0,
		showinfo: 0,
		//modestbranding:1,
		playlist:videoid,//'fFZwgPcW7FM',
		wmode:"transparent"
	},
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });
}

// 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {
	event.target.setVolume(0);
	event.target.playVideo();
}

// 5. The API calls this function when the player's state changes.
//    The function indicates that when playing a video (state=1),
//    the player should play for six seconds and then stop.
var done = false;
function onPlayerStateChange(event) {
  if (event.data == YT.PlayerState.ENDED) {
    //setTimeout(stopVideo, 6000);
	  player.playVideo();
    done = true;
  }
  event.target.setVolume(0);
}
function stopVideo() {
  player.stopVideo();
}
function changeVideoId(vid){
	 player.loadVideoById(vid);
 }