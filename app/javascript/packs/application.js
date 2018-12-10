import "bootstrap";
import $ from 'jquery';
import 'fullcalendar';

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
    eventSources: [

    // your event source
    {
      events: [ // put the array in the `events` property
        {
          title  : 'Menage - 29 rue Raphael',
          start  : '2018-12-12'
        },
        {
          title  : 'Jardinage',
          start  : '2018-12-13',
          end    : '2018-12-14'
        },
        {
          title  : 'Repassage',
          start  : '2018-12-14T12:30:00',
          end    : '2018-12-14T14:30:00'
        }
      ],
      color: 'black',     // an option!
      textColor: 'yellow' // an option!
    }

    // any other event sources...

  ]

});


