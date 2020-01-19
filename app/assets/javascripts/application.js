//= require rails-ujs
//= require_tree .

const hoursTag = document.querySelector('#booking_duration_4i');
const minutesTag = document.querySelector('#booking_duration_5i');

const pricePerHour = document.querySelector('#price_per_hour').value;

let bookingPrice = document.querySelector('#booking_booking_price');

const addChangeEvent = (htmlTag) => {
  htmlTag.addEventListener('change', (event) => {
    const hours = hoursTag.value;
    const minutes = minutesTag.value;
    bookingPrice.value = parseFloat(pricePerHour) * (parseFloat(hours) + parseFloat(minutes) / 60);
  });
};

addChangeEvent(hoursTag);
addChangeEvent(minutesTag);
