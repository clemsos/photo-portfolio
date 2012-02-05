$(document).ready(function() {
	$('.slideshow').cycle({ 
	    speed:  'fast', 
	    timeout: 0,
	 	startingSlide: 1,
	    next:   '#next', 
	    prev:   '#prev',
		pager:  '#thumbnails',
		pagerAnchorBuilder: function(idx, slide) {
		 	return '#thumbnails li:eq(' + (idx) + ') a';
		},
		onPrevNextEvent: function(isNext, zero, slide)  {
			var pic = $(slide).attr('rel');	
			$('span.current-pic').html(pic);
		},
		onPagerEvent: function(zero, slide)  {
			var pic = $(slide).attr('rel');	
			$('span.current-pic').html(pic);
		}
		
	});
	
	$('a.first-but').click(function() { 
		$('.slideshow').cycle(0); 
		return false;
	});
	
	var countpics = 1;
	
	$('div.picture').each(function(){
		$(this).attr({ "rel": countpics});
	});
			
	$('div.legend').each(function(){
		$(this).attr({ "rel": countpics});
		countpics = countpics +1;
	});
	
	$('.thumbs-but').click(function (){			
		var allpics = $('.slideshow .slide').length - 1;
		// console.log(allpics);
		$('.slideshow').cycle(allpics);
		return false;
	});
			
	
	// sort serie list by class menu
	$('li.top-item').insertAfter($('#menu li.home'));
	$('li.top-item').last().addClass('last');
	$('#menu li').eq(-2).addClass('last');	
	$('#menu li').last().addClass('last');	
	
});

$(document).bind('keydown', function(e) {
	
    if (e.keyCode == 37)
        $('.slideshow').cycle('prev');
     else if (e.keyCode == 39)
        $('.slideshow').cycle('next');
});