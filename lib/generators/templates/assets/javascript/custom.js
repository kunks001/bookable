$(document).ready(function(){
  calendar();
});

$(document).on('page:load', function() {
  calendar();
});


var calendar = function(){

    // page is now ready, initialize the calendar...

    var current_resource = function(){
    	return window.location.href.match(/resources\/(\d+)\/booking/)[1];
    };

    var today_or_later = function(){
      var check = $('#calendar').fullCalendar('getDate');
      var today = new Date();
      if(check < today) {
        return false;
      } else {
        return true;
      };
    };

    $('#calendar').fullCalendar({
        header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},

			eventSources: [{  
    		url: '/resources/'+current_resource()+'/bookings/',  
   		}],

   		selectable: {
      month: false,
      agenda: true
   	}	,

    editable: true,
    eventStartEditable: true, 
    eventDurationEditable: true,

    eventDrop: function(booking) {
      var length = (booking.end-booking.start)/(3600000);

        function updateEvent(booking) {
              $.ajax(
                '/resources/'+current_resource()+'/bookings/'+booking.id,
                { 'type': 'PATCH',

                  data: { booking: { 
                           start_time: "" + booking.start,
                           length: length
                         } }
                }
              );
          };

        updateEvent(booking);

      }
    ,

    eventResize: function(booking) {
      var length = (booking.end-booking.start)/(3600000);

        function updateEvent(booking) {
              $.ajax(
                '/resources/'+current_resource()+'/bookings/'+booking.id,
                { 'type': 'PATCH',

                  data: { booking: { 
                           start_time: "" + booking.start,
                           length: length
                         } }
                }
              );
          };

        updateEvent(booking);

      }
    ,

   	dayClick: function(date, allDay, jsEvent, view) {
      // console.log(view.name);
      if (view.name === "month") { 
        $('#calendar').fullCalendar('gotoDate', date);
        $('#calendar').fullCalendar('changeView', 'agendaDay');
      }
    }
    ,

 		select: function(start, end, allDay) {
      if (window.location.href.match(/new/)) {
        if(today_or_later()) {
        	var length = (end-start)/(3600000);

          $('#calendar').fullCalendar('renderEvent', 
            {
              start: start,
              end: end,
              allDay: false
            }
          );

          jQuery.post(
            '/resources/'+current_resource()+'/bookings',
            
            { booking: {
              start_time: start,
              length: length,

          	} }
          );

    	    } else {
            // alert("help!");
        }
      }
    }

	});

};