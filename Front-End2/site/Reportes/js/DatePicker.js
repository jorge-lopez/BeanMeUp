function LoadDatePicker(){  
 
  // implementation of disabled form fields
  var nowTemp = new Date();
  
  var checkin = $('#dpd1').fdatepicker().on('changeDate', function (ev) {
    if (ev.date.valueOf() > checkout.date.valueOf()) {
      var newDate = new Date(ev.date)
      newDate.setDate(newDate.getDate() + 1);
      checkout.setValue(newDate);
    }
    checkin.hide();
    
  }).data('datepicker');

  var checkout = $('#dpd2').fdatepicker({
    onRender: function (date) {
      return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
    }
  }).on('changeDate', function (ev) {
    checkout.hide();
  }).data('datepicker');

  $("#dpd1").mask("9999-99-99");
  $("#dpd2").mask("9999-99-99");
}