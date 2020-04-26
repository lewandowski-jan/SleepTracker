String getDay(int day) {
  if (day == 1) {
    return 'MONDAY';
  } else if (day == 2) {
    return 'TUESDAY';
  } else if (day == 3) {
    return "WEDNESDAY";
  } else if (day == 4) {
    return 'THURSDAY';
  } else if (day == 5) {
    return "FRIDAY";
  } else if (day == 6) {
    return 'SATURDAY';
  } else {
    return "SUNDAY";
  }
}

String getMonth(int month) {
  if (month == 1) {
    return 'JAN';
  } else if (month == 2) {
    return 'FEB';
  } else if (month == 3) {
    return "MAR";
  } else if (month == 4) {
    return 'APR';
  } else if (month == 5) {
    return "MAY";
  } else if (month == 6) {
    return 'JUN';
  } else if (month == 7) {
    return "JUL";
  } else if (month == 8) {
    return "AUG";
  } else if (month == 9) {
    return 'SEP';
  } else if (month == 10) {
    return "OCT";
  } else if (month == 11) {
    return 'NOV';
  } else {
    return "DEC";
  }
}