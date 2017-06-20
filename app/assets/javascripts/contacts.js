//= require jquery-ui/widgets/datepicker
//= require jquery-ui/i18n/datepicker-pt-BR
//= require jquery-mask-plugin

$(function(){
	$('.datepicker').datepicker();
  $('.datepicker').mask('00/00/0000');
  $('#cep').mask('00000-000');
});