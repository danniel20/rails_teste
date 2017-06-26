//= require jquery-ui
//= require jquery-ui/widgets/datepicker
//= require jquery-ui/i18n/datepicker-pt-BR
//= require jquery-mask-plugin
//= require cocoon

$(function(){
	$('.datepicker').datepicker();
  $('.datepicker').mask('00/00/0000');
  $('#cep').mask('00000-000');

  $("#phones a.add_fields").
      data("association-insertion-method", 'after').
      data("association-insertion-node", 'this');
});