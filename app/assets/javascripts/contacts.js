//= require jquery-ui
//= require jquery-ui/widgets/datepicker
//= require jquery-ui/i18n/datepicker-pt-BR
//= require jquery-mask-plugin
//= require cocoon

$(function(){
	$('.datepicker').datepicker();
  $('.datepicker').mask('00/00/0000');
  $('#cep').mask('00000-000');
  $('.phone-number').mask('(00) 0000-0000');

  $("#phones a.add_fields").
      data("association-insertion-method", 'after').
      data("association-insertion-node", 'this');

  $('#phones').on('cocoon:after-insert', function(e, insertedItem) {
    $('.phone-number').mask('(00) 0000-0000');
  });


  // Checkboxes
  $('#deletar-contatos').hide()

  $('.checkAll').on('click', function(){
    $(this).closest('table').find('tbody :checkbox').prop('checked', this.checked)

    if($('.checkAll').prop('checked')){
      $('#deletar-contatos').show()
    }
    else{
      $('#deletar-contatos').hide()
    }

  });

  $('tbody :checkbox').on('click', function(){

    let checkboxes_quantity = $(this).closest('table').find('tbody :checkbox').length
    let checkboxes_marked_quantity = $(this).closest('table').find('tbody :checkbox:checked').length

    if ( checkboxes_marked_quantity == 0 ){
      $('.checkAll').prop('checked', false)
      $('#deletar-contatos').hide()
    }
    
    if ( checkboxes_marked_quantity > 0 ){
      $('.checkAll').prop('checked', false)
      $('#deletar-contatos').show()
    }

  });

  //Deletar contatos dos checkboxes marcados
  $('#deletar-contatos').on('click', function(event){
    event.preventDefault();

    if(!confirm("Deseja realmente remover o(s) contato(s) selecionado(s) ?")){
      return false;
    }

    contact_ids = []
    contact_checked_elements = $('tbody :checkbox:checked')

    $('tbody :checkbox:checked').each(function(index, element){
      contact_ids.push(element.value)
    });

    $.ajax({
      url: '/contacts/' + contact_ids.join(","),
      type: 'DELETE',
      dataType: "json",
      success: function(data) {
        contact_checked_elements.parents('tr').fadeOut().remove()
        $('#deletar-contatos').hide()

        $.notify( { message: data.msg}, { type: 'success', placement: { from: 'top',align: 'center'} } );

      },
      error: function( req, status, err ) {
        console.log("Error: " + status);
      }
    });


  });

});