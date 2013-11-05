$(document).ready(function() {

    // page is now ready, initialize the calendar...

    var current_<%=folder_name.singularize%> = function(){
    	return window.location.href.match(/<%=folder_name%>\/(\d+)\/booking/)[1];
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
    		url: '/<%=folder_name%>/'+current_<%=folder_name.singularize%>()+'/bookings/',  
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
                '/<%=folder_name%>/'+current_<%=folder_name.singularize%>()+'/bookings/'+booking.id,
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
                '/<%=folder_name%>/'+current_<%=folder_name.singularize%>()+'/bookings/'+booking.id,
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
    },

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
            '/<%=folder_name%>/'+current_<%=folder_name.singularize%>()+'/bookings',
            
            { booking: {
              start_time: start,
              length: length,

          	} }
          );

    	    } else {
        }
      }
    }
	});

});
