import $ from 'jquery';
import 'fullcalendar';


const calendarElements = document.getElementsByClassName('modal-calendar');
if (calendarElements.length >= 1){
  Array.prototype.forEach.call(calendarElements, function(calendarElement, i) {
    let prestations = JSON.parse(calendarElement.dataset.prestations);
    console.log("prestations are :", prestations);
    console.log("will apply to :", calendarElement.id);
    $(`#${calendarElement.id}`).fullCalendar({
      defaultView: 'listWeek',  //je peux afficher à la journée avec listDay
      firstDay: 1,
      buttonText: {
      prev: '<',
      next: '>',
      today:    "Aujourd'hui",
      month:    'mois',
      week:     'semaine',
      day:      'jour',
      list:     'liste'
      },
      hiddenDays: [ 0 ],  // ici je cache le dimanche
      events: prestations
    });
  })
}

