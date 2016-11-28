document.addEventListener("turbolinks:load", function() {
  $('body').on('change', '#reg_institution_id', function(e) {
    $.get( "/api/v1/groups?institution_id=" + $(this).val(), function( data ) {
      var groups = data.groups;
      $('#user_group_id').empty();
      groups.forEach(function(group){
      $('#user_group_id').append($('<option>', {
        value: group.id,
        text : group.name
        }));
      });
      $('#user_group_id').prop('disabled', false);
    });
  });
})
