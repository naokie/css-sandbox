$(function() {
	$('#calendar').datepicker({
		inline: true,
		firstDay: 1,
		showOtherMonths: true,
		dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
	});
	
	var slider = $('#slider'), tooltip = $('.volume-label');
	tooltip.hide();
	
	slider.slider({
		range: 'min',
		min: 1,
		value: 35,
		start: function(event, ui) {
			tooltip.fadeIn('fast');
		},
		slide: function(event, ui) {
			var value = slider.slider('value'), volume = $('.volume');
			tooltip.css('left', value).text(ui.value);
			
			if (value <= 5) {
				volume.css('background-position', '0 0');
			} else if (value<=25) {
				volume.css('background-position', '0 -25px');
			} else if (value<=75) {
				volume.css('background-position', '0 -50px');
			} else {
				volume.css('background-position', '0 -75px');
			}
		},
		stop: function(event, ui) {
			tooltip.fadeOut('fast');
		}
	});
	
	$('#button').on('click', function() {
		$(this).toggleClass('on');
	});
});