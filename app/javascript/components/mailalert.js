import swal from 'sweetalert';


function bindSweetAlertButtonDemo() {
  for(var i=0; i<gon.booking_ids.length;i++) {
  let swalButton = document.getElementById('sweet-alert-demo-'+gon.booking_ids[i]);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "Mail envoyé!",
        text: "Votre employé a reçu la prestation à realiser.",
        icon: "success"
      });
    });
  }
}
}
export { bindSweetAlertButtonDemo };
