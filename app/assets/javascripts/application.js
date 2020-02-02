//= require rails-ujs
//= require_tree .

// Add change event on start date
if (startDay || startMonth || startYear || startHour || startMinute) {
  startDay.addEventListener('change', (event) => update(endDay));
  startMonth.addEventListener('change', (event) => update(endMonth));
  startYear.addEventListener('change', (event) => update(endYear));
  startHour.addEventListener('change', (event) => update(endHour));
  startMinute.addEventListener('change', (event) => update(endMinute));
}
// Add change event on end date (only time)
if (endHour || endMinute) {
  endHour.addEventListener('change', totalPrice);
  endMinute.addEventListener('change', totalPrice);
}
