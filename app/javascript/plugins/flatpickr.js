import flatpickr from "flatpickr";
import "flatpickr/dist/themes/material_blue.css";

const newBookingForm = document.getElementById('new_booking');
if (newBookingForm) {
  const dateNow = new Date();
  flatpickr("#date", {
    // enableTime: true,
    // time_24hr: true,
    defaultDate: dateNow,
    dateFormat: "l d F Y",
    inline: true
  });
  flatpickr("#start_time", {
    noCalendar: true,
    enableTime: true,
    time_24hr: true,
    defaultDate: dateNow,
    dateFormat: "H:i",
    inline: true
  });
  const timePlusOneHour = dateNow.getHours() + 1;
  const datePlusOneHour = dateNow.setHours(timePlusOneHour);
  flatpickr("#end_time", {
    noCalendar: true,
    enableTime: true,
    time_24hr: true,
    defaultDate: datePlusOneHour,
    dateFormat: "H:i",
    inline: true
  });
}
