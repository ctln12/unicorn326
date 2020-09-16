import flatpickr from "flatpickr";
import "flatpickr/dist/themes/material_blue.css";

const newBookingForm = document.getElementById('new-booking-form-page');
const editBookingForm = document.getElementById('edit-booking-form-page');
if (newBookingForm) {
  const dateNow = new Date();
  flatpickr("#new_date", {
    defaultDate: dateNow,
    dateFormat: "l d F Y",
    inline: true
  });
  flatpickr("#new_start_time", {
    noCalendar: true,
    enableTime: true,
    time_24hr: true,
    defaultDate: dateNow,
    dateFormat: "H:i",
    inline: true
  });
  const timePlusOneHour = dateNow.getHours() + 1;
  const datePlusOneHour = dateNow.setHours(timePlusOneHour);
  flatpickr("#new_end_time", {
    noCalendar: true,
    enableTime: true,
    time_24hr: true,
    defaultDate: datePlusOneHour,
    dateFormat: "H:i",
    inline: true
  });

} else if (editBookingForm) {
  flatpickr("#edit_date", {
    dateFormat: "l d F Y",
    inline: true
  });
  flatpickr("#edit_start_time", {
    noCalendar: true,
    enableTime: true,
    time_24hr: true,
    dateFormat: "H:i",
    inline: true
  });
  flatpickr("#edit_end_time", {
    noCalendar: true,
    enableTime: true,
    time_24hr: true,
    dateFormat: "H:i",
    inline: true
  });
}
