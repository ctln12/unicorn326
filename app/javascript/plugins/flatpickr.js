import flatpickr from "flatpickr";

const newBookingForm = document.getElementById('new_booking');
if (newBookingForm) {
  flatpickr(".datepicker", {
    allowInput: true,
    enableTime: true,
    time_24hr: true,
    defaultDate: new Date(),
    dateFormat: "l d F Y at H\\hi"
  });
}

