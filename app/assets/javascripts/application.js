// Equivalent of rails link_to_remote helper.
//----------------------------------------------------------------------------
$("a.remote").livequery('click', function(e) {
	var type = 'GET';
	var el = $(this);

	if(el.hasClass('update')) {
	    type = 'PUT';
	Util.requestAjax(el.attr('href'), type);
	}else if(el.hasClass('delete')) {
	    type = 'DELETE';
	    ref = el.attr('rel');
	    var confirmMsg = el.attr('rel').length ? el.attr('rel') : 'Are you sure to delete?';
			var titleMsg = el.attr('title').length ? el.attr('title') : 'Are you sure to delete?';
	    jConfirm(confirmMsg, titleMsg, function(r){
				if(r){
					Util.requestAjax(el.attr('href'), type);
				}
			});
	}else if(el.hasClass('view_child_test_report')){
			$(".row_selected").removeClass("row_selected");
			el.parent().parent().addClass("row_selected");
			Util.requestAjax(el.attr('href'), type);
	}else{
			Util.requestAjax(el.attr('href'), type);
	}
  e.preventDefault();
});

// Equivalent of rails link_to_remote helper.
// Only to send requests using http delete.
//----------------------------------------------------------------------------
$("a.remoteDelete").livequery('click', function() {
    $.ajax({
        url: $(this).attr('href'),
        dataType: "script",
        type: "DELETE",
        data: {'_' : String(new Date().getTime())}, // To fix 'Error occurred while parsing request parameters' while using Google Chrome
        beforeSend: function(xhr) {
            xhr.setRequestHeader("Accept", "text/javascript");
        }
    });
    return false;
});

//Form submit with ajax
//----------------------------------------------------------------------------
$('form').livequery(function() {
	$(this).validate({
	 submitHandler: function(form) {
			var f = $(form);
	   	if(f.hasClass('remote')) {
					f.ajaxSubmit({
				  		dataType: 'script'
				  });
			}else{
					form.submit();
			}   
	 }
	});	
	return false; 
});

// Global ajax activity indicators.
//----------------------------------------------------------------------------
$(document).ajaxStart(function(){
    $('#progress').animate({top: 0});
}).ajaxStop(function(){
    $('#progress').animate({top: '-300px'});
});

$(document).ajaxComplete(function(event,response,settings) {
    if(response.status == 401) {
        var newLocationObject = Util.parseJSON(response.responseText);
        window.location = newLocationObject.location;
    }
});


// Namespace for storing all utility functions
//----------------------------------------------------------------------------
if (typeof Util == 'undefined') {
    Util = {};
}

Util = {
	requestAjax : function(url, type) {
		$.ajax({
            url: url,
            type: type,
            dataType: "script",
            data: {'_' : String(new Date().getTime())}, // To fix 'Error occurred while parsing request parameters' while using Google Chrome
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "text/javascript");
            }
        });
	}
}


$(document).ready(function(){
	  humane.timeout = 5000; // 5 sec
	  humane.clickToClose = true;
});

