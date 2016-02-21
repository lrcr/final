var main_back = [ "#f1ac1d", "#dc0030", "#b10058", "#7c378a", "#3465aa", "#09a275", "#e57d04" ];
var main_vid = [ "fFZwgPcW7FM", "ly6J5BQkXgA", "4OFAY0Du65A", "Tqa9LGsC5SU", "u_f2gzaDTKA" ];
var main_sub_back = [ "#ee6334", "#ff8200", "#ed1369", "#777777", "#00aba8", "#666633", "#13cced", "#456c6c", "#4dbf13", "#794b80", "#ec3b4b", "#00fdfd" ];
var main_sub_rgb = [ "238,99,52", "255,130,0", "237,19,105", "77,191,19", "0,171,168", "102,102,51", "19,204,237", "255,130,0", "121,75,128", "69,108,108",
		"236,59,75", "0,253,253", "119,119,119","238,99,52", "255,130,0", "237,19,105", "77,191,19", "0,171,168", "102,102,51", "19,204,237", "255,130,0", "121,75,128", "69,108,108",
		"236,59,75", "0,253,253", "119,119,119","238,99,52", "255,130,0", "237,19,105", "77,191,19", "0,171,168", "102,102,51", "19,204,237", "255,130,0", "121,75,128", "69,108,108",
		"236,59,75", "0,253,253", "119,119,119" ];
/* YouTube Player API */
var videoid;
function createYouTubeAPI(vid) {
	videoid = vid;
	// 2. This code loads the IFrame Player API code asynchronously.
	var tag = document.createElement('script');

	tag.src = "https://www.youtube.com/iframe_api";
	var firstScriptTag = document.getElementsByTagName('script')[0];
	firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
}

// 3. This function creates an <iframe> (and YouTube player)
// after the API code downloads.
var player;
function onYouTubeIframeAPIReady() {
	player = new YT.Player('player', { width : '100%', height : '100%', videoId : videoid, // 'fFZwgPcW7FM',
	playerVars : { autoplay : 1, controls : 0, loop : 1, rel : 0, showinfo : 0,
	// modestbranding:1,
	playlist : videoid,// 'fFZwgPcW7FM',
	wmode : "transparent" }, events : { 'onReady' : onPlayerReady, 'onStateChange' : onPlayerStateChange } });
}

// 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {
	event.target.setVolume(0);
	event.target.playVideo();
}

// 5. The API calls this function when the player's state changes.
// The function indicates that when playing a video (state=1),
// the player should play for six seconds and then stop.
var done = false;
function onPlayerStateChange(event) {
	if (event.data == YT.PlayerState.ENDED) {
		// setTimeout(stopVideo, 6000);
		player.playVideo();
		done = true;
	}
	event.target.setVolume(0);
}
function stopVideo() {
	player.stopVideo();
}
function changeVideoId(vid) {
	player.loadVideoById(vid);
}

var col_arr = [ "tv", "addr", "indu", "", "" ];
var col;
function listlink(val) {
	location.href = "listlink?col=" + col + "&val=" + val;
}
/* 서브메뉴 배경색 */
function mainSubBack(i, e) {
	if ($(window).width() < 768){
		$(e).css({ "background" : "rgba(" + main_sub_rgb[i] + ",0.7)" });
	}else{
		$(e).css({ "background" : "rgba(" + main_sub_rgb[i] + ",0.4)" });
	}
	$(e).hover(function() {
		$(this).css({ "background" : "rgba(" + main_sub_rgb[i] + ",1)" });
	}, function() {
		$(this).css({ "background" : "rgba(" + main_sub_rgb[i] + ",0.4)" });
	});
}
/* 동영상 on/off */
function onoff() {
	if ($(".onoff").hasClass("btn_onoff")) {
		$(".main_menu").each(function(i, e) {
			if ($(this).hasClass("this_view")) {
				createYouTubeAPI(main_vid[i]);
				changeVideoId(main_vid[i]);
				$("#player").animate({ "display" : "black" }, 700, function() {
					$(this).animate({ "width" : "100%", "height" : "100%", "margin" : "0" }, 300);
				});
			}
		});
		$(".onoff").removeClass("btn_onoff");
	} else {
		$("#player").animate({ "width" : "0", "height" : "0", "margin" : "20% 50%" }, 300, function() {
			stopVideo();
		});
		$(".onoff").addClass("btn_onoff");
	}
}
/* index 대분류 */
function indexLoad(i, e) {
	$(e).css({ "background" : main_back[i] });
	$(e).click(function() {
		col = col_arr[i];
		$(".main_menu .main_text").show().css({ "font-size" : "14px" }).children().show();
		$(".main_menu").removeClass("this_view");
		$("#player,.sub_menu").addClass("hid");
		$(this).addClass("this_view");
		if ($(window).width() < 768) {
			$(".main_index").css({"height":"30px" ,"line-height":"30px"});
			$(".main_menu").stop().animate({ "opacity" : 1, "width" : "20%","height":"30px" ,"line-height":"30px"}, 400);
			$(".sub_menu_" + (i + 1)).css({"margin-left": "0"}).removeClass("hid");
		} else {
			$(".main_menu").stop().animate({ "opacity" : 1, "width" : "2.5%" }, 400);
			$(this).stop().animate({ "opacity" : 0.4, "width" : "90%" }, 400, function() {
				$(".sub_menu_" + (i + 1)).stop().css("margin-left", (i * 2.5) + "%");
				$("#player,.sub_menu_" + (i + 1)).removeClass("hid");
			}).children().hide();
			createYouTubeAPI(main_vid[i]);
			changeVideoId(main_vid[i]);
		}
	});
}