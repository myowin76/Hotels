// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){

	$('#pics').cycle({
		timeout: 20000,
		fx: 'fade',
		pager: '#cycle-nav',
		pauseOnPagerHover: 0
	});
	$("#datepicker").datepicker({ buttonImage: '/images/datepicker.gif' });
	

});