// Select start date fields
const startDay = document.querySelector('#booking_start_date_3i');
const startMonth = document.querySelector('#booking_start_date_2i');
const startYear = document.querySelector('#booking_start_date_1i');
const startHour = document.querySelector('#booking_start_date_4i');
const startMinute = document.querySelector('#booking_start_date_5i');
// Select end date fields
const endDay = document.querySelector('#booking_end_date_3i');
const endMonth = document.querySelector('#booking_end_date_2i');
const endYear = document.querySelector('#booking_end_date_1i');
const endHour = document.querySelector('#booking_end_date_4i');
const endMinute = document.querySelector('#booking_end_date_5i');

// Update total price
const totalPrice = () => {
  const pricePerHour = document.querySelector('#price_per_hour');
  const bookingPrice = document.querySelector('#booking_booking_price');

  const hoursDifference = parseInt(endHour.value) - parseInt(startHour.value);
  const minutesDifference = parseInt(endMinute.value) - parseInt(startMinute.value);
  const hours = hoursDifference + minutesDifference / 60;
  bookingPrice.value = parseInt(pricePerHour.value) * hours;
};

// Update end date and add 1 hour to it
const update = (endDate) => {
  const startTag = event.target;
  const startValue = parseInt(startTag.value);
  if (startTag === startHour && startValue < 9) {
    endDate.value = `0${startValue + 1}`;
  } else if (startTag === startHour) {
    endDate.value = startValue + 1;
  } else {
    endDate.value = startTag.value;
  }
  totalPrice();
};

// Add change event on start date
if (startDay || startMonth || startYear || startHour || startMinute) {
startDay.addEventListener("change", event => update(endDay));
startMonth.addEventListener("change", event => update(endMonth));
startYear.addEventListener("change", event => update(endYear));
startHour.addEventListener("change", event => update(endHour));
startMinute.addEventListener("change", event => update(endMinute));
}

// Add change event on end date (only time)
if (endHour || endMinute) {
endHour.addEventListener("change", totalPrice);
endMinute.addEventListener("change", totalPrice);
}
