import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  const swalButton = document.getElementById('sweet-alert-demo');
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

export { bindSweetAlertButtonDemo };
