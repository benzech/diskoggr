//$('.delete_artist').bind('ajax:success', function() {
//    $(this).closest('tr').fadeOut();
//});

$('.auto_search_complete').live('change', function() {
    $(this).parents('form:first').submit();
    return false;
});

$('#search_artist').bind('ajax:success', function(evt, data, status, xhr) {
    eval(xhr.responseText);
});

var request = function(options) {
  $.ajax($.extend({ url : options.url, type : 'get' }, options));
  return false;
};

// remote links handler
$('a[data-remote=true]').live('click', function() {
  return request({ url : this.href });
});

// remote forms handler
$('form[data-remote=true]').live('submit', function() {
  return request({ url : this.action, type : this.method, data : $(this).serialize() });
});