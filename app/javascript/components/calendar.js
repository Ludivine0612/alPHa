import $ from 'jquery';
import 'fullcalendar';


//BUG ??
//
// const events = JSON.parse(mapElement.calendar.events);
// events.forEach((event) => {
//   new calendar.Event()
//     .title,
//     .start,
//     .end,
// });


$('#calendar').fullCalendar({
    defaultView: 'listWeek',  //je peux afficher à la journée avec listDay
    height: 500,
    firstDay: 1,
    buttonText: {
    prev: '<',
    next: '>',
    today:    "Aujourd'hui",
    month:    'mois',
    week:     'semaine',
    day:      'jour',
    list:     'liste',
    },
    header: {
      left:   'title',
      center: '',
      right:  'today prev,next'
    },
    hiddenDays: [ 0 ],  // ici je cache le dimanche
    events:[
    {
      title  : 'event1',
      start  : '2010-01-01'
    },
    {
      title  : 'event2',
      start  : '2010-01-05',
      end    : '2010-01-07'
    },
    {
      title  : 'event3',
      start  : '2010-01-09T12:30:00'
    }
  ]
});


