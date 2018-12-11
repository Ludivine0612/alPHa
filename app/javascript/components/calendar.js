import $ from 'jquery';
import 'fullcalendar';

const events = JSON.parse(mapElement.calendar.events);
events.forEach((event) => {
  new calendar.Event()
    .title,
    .start,
    .end,
});


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
    events: @events
});


