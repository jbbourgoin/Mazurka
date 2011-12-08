var initDatepicker = function() {
	$('input[type=date]').each(function() {
		var $input = $(this);
		$input.datepicker({
			minDate: $input.attr('min'),
			maxDate: $input.attr('max'),
			dateFormat: 'yy-mm-dd'
		});
	});
};

if(!Modernizr.inputtypes.date){
	$(document).ready(initDatepicker);
};