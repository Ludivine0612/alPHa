import $ from 'jquery';
import 'fullcalendar';


const calendarElement = document.getElementById('modal-calendar');
if (calendarElement){
  const events = JSON.parse(calendarElement.dataset.toto);


  $('#modal-calendar').fullCalendar({
      defaultView: 'listWeek',  //je peux afficher à la journée avec listDay
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
      hiddenDays: [ 0 ],  // ici je cache le dimanche
      events: events
  });
}

