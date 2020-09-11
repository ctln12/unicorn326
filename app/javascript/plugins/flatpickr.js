import flatpickr from "flatpickr";
import "flatpickr/dist/themes/material_blue.css";

const newBookingForm = document.getElementById('new_booking');
if (newBookingForm) {
  const dateNow = new Date();
  flatpickr("#start_date", {
    enableTime: true,
    time_24hr: true,
    defaultDate: dateNow,
    dateFormat: "l d F Y at H\\hi"
  });
  const timePlusOneHour = dateNow.getHours() + 1;
  const datePlusOneHour = dateNow.setHours(timePlusOneHour);
  flatpickr("#end_date", {
    // noCalendar: true,
    enableTime: true,
    time_24hr: true,
    defaultDate: datePlusOneHour,
    dateFormat: "l d F Y at H\\hi"
  });
}
