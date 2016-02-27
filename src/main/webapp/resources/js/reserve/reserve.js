/**
 * 
 */
$(document).ready(function() {
	var today = $.fullCalendar.moment(new Date());
			$('#calendar').fullCalendar({
				height: 450,
						header : { left : 'prev', right : 'next today', center : 'title', },
						dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
						views : { month : { // name of view
						titleFormat : 'YYYY년  M월' // other view-specific
						// options here
						} },
						defaultDate : today.format(),//'2016-01-12',
						dayClick : function(date, jsEvent, view) {

							alert('Clicked on: ' + date.format());

							// change the day's background color just for fun
							$(this).css('background-color', 'red');

						},
						editable : true,
						eventLimit : true, // allow "more" link when too many
						// events
						events : [ 
						        { title : 'All Day Event', start : '2016-01-01' },
						        { title : 'Long Event', start : '2016-01-07', end : '2016-01-10' },
								{ id : 999, title : 'Repeating Event', start : '2016-01-09T16:00:00' },
								{ id : 999, title : 'Repeating Event', start : '2016-01-16T16:00:00' },
								{ title : 'Conference', start : '2016-01-11', end : '2016-01-13' },
								{ title : 'Meeting', start : '2016-01-12T10:30:00', end : '2016-01-12T12:30:00' },
								{ title : 'Lunch', start : '2016-01-12T12:00:00' }, 
								{ title : 'Meeting', start : '2016-01-12T14:30:00' },
								{ title : 'Happy Hour', start : '2016-01-12T17:30:00' }, 
								{ title : 'Dinner', start : '2016-01-12T20:00:00' },
								{ title : 'Birthday Party', start : '2016-01-13T07:00:00' },
								{ title : 'Click for Google', url : 'http://google.com/', start : '2016-01-28' } ] });

		});