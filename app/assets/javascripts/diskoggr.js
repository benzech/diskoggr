$('.delete_artist').bind('ajax:success', function() {
    $(this).closest('tr').fadeOut();
});