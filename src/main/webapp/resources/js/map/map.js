function viewmap(a,b,c) {
	$(".mapview").css("height","200px");
	
			var latlng = new google.maps.LatLng(a,b);
			$("#"+c+"th-mview").gmap({
				'center':latlng,
				'zoom':16,	// 맵의 줌 1~21
				'disableDefaultUI':true, // ui에 조작 메뉴 on/off
				'callback': function(){}
			});
			$("#"+c+"th-mview").gmap('addMarker', {'position': latlng}).load();
		}