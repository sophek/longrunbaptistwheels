$(document).ready(function() {
	'use strict';
// Initalize data
    

    
    var baseUrl = "http://127.0.0.1:8500/longrunbaptistwheels/";
    
    //Toast options
    
toastr.options = {
  "closeButton": false,
  "debug": false,
  "newestOnTop": true,
  "progressBar": false,
  "positionClass": "toast-top-right",
  "preventDuplicates": true,
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "2000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
};
    
    // Hide the page title entry box on first load
	$( "#entrybox" ).hide();
    
    // Hide the rename checkbox
    $( "#renamePage" ).hide();
    
    // Add a toggle to the page title entry box
    $( "#pageEntrybox" ).click(function() {
        $( "#entrybox" ).toggle( "slow" );
    });
    
    
// Create new page logic    
   $("#createpage").click(function(){
     var localFilename = $("#page").val();
     var categoryid =  $("#categories").val();
     var layout =  $("#layouts").val();   
     //If the page title is empty, show the error notification
     if (localFilename === ""){
         //alert(window.location.host);
            toastr["error"]("Please enter a page title!");   
        } else {
            
        $.post(baseUrl + 'createnewpage.cfm',
    {
        content: "New Content goes here",
        id: localFilename,
        pageUrl : 'page.cfm',
        catid : categoryid,
        layoutid : layout
    },
    function(data, status){
        $("#page").val("");   
        //alert("Data: " + data + "\nStatus: " + status);
        loadPages();
        $("#success").html(data);
    });     
    }
});
//End Create New page  
    
    function loadPages(){
    var myUrl = baseUrl + "listofpages.cfm"; 
    $.get( myUrl, function( data ) {
      $( "#headings" ).html( data );
    }); 
}
    
    
	/*---------------  sliderpage ------------------*/
	$('.slider').slick({
	  	slidesToShow: 1,
	    infinite: true,
	  	slidesToScroll: 1,
	  	arrows: false,
	  	dots:true,
	  	autoplay: true,
	 	autoplaySpeed:3000
	 	 
	});
	
	$('.event_slide').slick({
	  	slidesToShow: 1,
	    infinite: true,
	  	slidesToScroll: 1,
	  	arrows: true,
	  	dots:false,
	  	autoplay: false,
	 	autoplaySpeed:3000
	 	 
	});
	$('.gallery-wrapper ').slick({
		slidesToShow:8,
		infinite: true,
		slidesToScroll: 1,
		autoplay: true,
		arrows: false,
		autoplaySpeed: 2000, 
		responsive: [
		    {
		      breakpoint: 2000,
		      settings: {
		        slidesToShow: 5,
		        slidesToScroll: 1,
		        infinite: true,
		        dots: false
		      }
		    },
		    {
		      breakpoint: 992,
		      settings: {
		        slidesToShow: 3,
		        slidesToScroll: 1

		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        slidesToShow: 2,
		        slidesToScroll: 1
		      }
		    }
		]   
	});
	/*---------------  slider event ------------------*/	
	var sliderCount = $('.slide-show').length;
	for (var i=0; i<sliderCount; i++) {
		var slideShowId = 'slide-show'+i;
		var slideShowPrev = 'prev-slide'+i;
		var slideShowNext = 'next-btn'+i;
		$('.slide-show').eq(i).attr("id",slideShowId);
		$('.prev-slide').eq(i).attr("id",slideShowPrev);
		$('.next-slide').eq(i).attr("id",slideShowNext);
		var slideShowPrevid = '#'+slideShowPrev;
		var slideShowNextid = '#'+slideShowNext;

		$('#'+slideShowId).slick({
	  	slidesToShow: 1,	  	
	  	slidesToScroll: 1,
	  	arrows: true,
	  	autoplay: true,
	 	autoplaySpeed: 5000,
	 	prevArrow: slideShowPrevid,
    	nextArrow: slideShowNextid
		});
	}
		
	/*---------------  slider Donation ------------------*/
	$('.slider-donation').slick({
	 	slidesToShow: 1,
	 	slidesToScroll: 1,
	  	arrows:true,
	  	autoplay: false,
	 	autoplaySpeed: 5000,
  		prevArrow: '.prev-btn',
    	nextArrow: '.next-btn'
	});	


	/*---------------  navbar  ------------------*/		
	$('.navbar-toggle').on('click' ,function() {
		var wh = $(window).height(); 
		$('.wrapper-body').css('max-height' , wh );
		$('.navbar').find('.nav-menu').addClass('open');
		$('.overlay').addClass('overlay-open');
	});
	$('.close').on('click', function(){
		$('.wrapper-body').css('max-height' , 'inherit' );
		$('.navbar').find('.nav-menu').removeClass('open');
		$('.overlay').removeClass('overlay-open');
		$('.search-box-top').removeClass('open-search');
	});


	/*---------------  register-modal ------------------*/
	$('.open-register').on('click' ,function(){
		var wh = $(window).height(); 
		$('.wrapper-body').css('max-height' , wh );
		$('.overlay-event ').addClass('event-open');
	});
	$('.close-event').on('click' ,function(){
		$('.wrapper-body').css('max-height' , 'inherit' );
		$('.overlay-event ').removeClass('event-open');
	});


	/*--------------- pretty photo ------------------*/
	$('a.zoom').prettyPhoto();


	/*---------------  search box ------------------*/
	$('.search-box-tablet').on('click' , function(){
		//$('.search-box-top').toggleClass('open-search');		
	});


	/*---------------  Countdown plugin  ------------------*/
	(function($){
	  // Constructor
	  	function Countdown( element, date ) {
		    this.$element = $(element);
		    this.date     = date;
		    this.init();
	  	}
	  	// Initialize interval countdown
	  	Countdown.prototype.init = function(){
	    var _this = this;	    
	    	setInterval(function(){
	      		var diff = _this.time_difference();	      
			    $('.days .count').text(diff.days);
			    $('.hours .count').text(diff.hours);
			    $('.minutes .count').text(diff.minutes);
			    $('.seconds .count').text(diff.seconds);
	    	}, 1000);	    
	  	};
	  	// Time difference between given date & current date
	  	// @return [object]
	  	Countdown.prototype.time_difference = function(){
	    	var days, hours, interval, minutes, seconds,	 
	        ms_per_minute = 1000 * 60,
	        ms_per_hour   = ms_per_minute * 60,
	        ms_per_day    = ms_per_hour * 24,	        
	        current_date  = new Date();	  
		    if ( current_date > this.date ) {
		      interval = current_date - this.date.getTime();
		    } else {
		      interval = this.date.getTime() - current_date;
		    }	   
		    days     = Math.floor(interval / ms_per_day);
		    interval = interval - (days * ms_per_day);

		    hours = Math.floor(interval / ms_per_hour);
		    interval = interval - (hours * ms_per_hour);

		    minutes = Math.floor(interval / ms_per_minute);
		    interval = interval - (minutes * ms_per_minute);
		    seconds = Math.floor(interval / 1000);
		    return { 
		      days: days, 
		      hours: hours, 
		      minutes: minutes, 
		      seconds: seconds
		    };

	  	};  
	  // jQuery plugin
	  	$.fn.countdown = function(date_a, date_b){
		    this.each(function(){
			    var $this = $(this);
			    if ( !$this.data('js-countdown') ) {
			        $this.data('js-countdown', new Countdown(this, date_a, date_b) );
			    }		      
		    });
	  	};
	}(jQuery));


	/*--------------- Initialize plugin ------------------*/
	$('.js-countdown').countdown( 
	  new Date(2015,4,15,24,0,0)
	// countdown from the below date
	// new Date(year,month,date,hours,minutes,seconds)
	);


	/*--------------- header fixed to top ------------------*/
	$(window).on('scroll', function() {
		var movableHeight = ($('.header-top').height());
       	if ($(window).scrollTop() > movableHeight) {
       		$('.menu').addClass('menu-fixed');
       		$('.button-wrapper').addClass('top-content');
       	}
       	else {
       		$('.menu').removeClass('menu-fixed');
       		$('.button-wrapper').removeClass('top-content');
       	}
   	});
	/*--------------- blog image height ------------------*/
	function blogcontrol(){
		if ($(window).width() >= 480) {
			var contentHeight=$('.holder .blog-holder:nth-of-type(2)').outerHeight();
			$('.holder .blog-holder:nth-of-type(1) .imageholder-blog').css('height' , contentHeight);
		}
	}
	blogcontrol();	
	/*---------------event others height ------------------*/
	function eventcontrol(){
		if ($(window).width() >= 480) {
			var eventHeight=$('.event-other .counter-wrap .figcaption').outerHeight();
			$('.event-other .counter-wrap .figure').css('height' , eventHeight);
		}
	}	
	eventcontrol();
	function eventscontrol(){
		if ($(window).width() >= 768) {
			var eventHeight=$('section.event .left-fig').outerHeight();
			$('section.event .right-fig').css('height' , eventHeight);
		}
	}	
	eventscontrol();
	/*--------------- Dropdown  ------------------*/
	function dropdwn(){		
		if ($(window).width() <= 992) {
			$('.dropdown').on('click'  , function(){
				$('.menu-bar li .submenu').toggleClass('add-submenu');
			});		
		}
	}
	dropdwn();
	$(window).on('resize', function() {
		 dropdwn(); 
		 eventcontrol();
		 blogcontrol();
		 eventscontrol();
	});

	/*--------------- RESIZE FUNCTION  ------------------*/
	$(window).on('resize', function() {
		if ($(window).width() >= 992) { wayPoint(); }
	});
	if ($(window).width() >= 992) { wayPoint(); }


	/*--------------- WAYPOINt ------------------*/
	function wayPoint() {
		$('.event').waypoint(function() {
			setTimeout(function() {
				$('.event').addClass('animated flipInX');
			}, 100);

		}, { offset: '70%' });
		$('.s-header .button-wrapper').waypoint(function() {
			setTimeout(function() {
				$('.btn-content').addClass('animated fadeInUp');
			}, 100);
		}, { offset: '70%' });

		$('.about').waypoint(function() {
			setTimeout(function() {
				$('section.about .figure:nth-of-type(1)').addClass('animated fadeInLeft');
				$('section.about .figure:nth-of-type(2)').addClass('animated fadeInUp');
				$('section.about .figure:nth-of-type(3)').addClass('animated fadeInRight');

			}, 100);
			
		}, { offset: '70%' });

		$('.upcoming-event').waypoint(function() {
			setTimeout(function() {
				$('section.upcoming-event .figure .item-fig ').addClass('animated fadeInDown');
				$('section.upcoming-event .figure .item-content ').addClass('animated fadeInUp');
				
			}, 100);
		}, { offset: '70%' });

		$('header').waypoint(function() {
			setTimeout(function() {
				$('section.aboutus .figure .figcaption').addClass('animated fadeInRight');
				$('section.aboutus .figure .fig').addClass('animated fadeInLeft');
			}, 100);	
		}, { offset: '70%' });

		$('section.quotation').waypoint(function() {
			setTimeout(function() {
				$('section.quotation h5').addClass('animated fadeInUp');
				$('section.quotation p').addClass('animated fadeInUp');
			}, 100);	
		}, { offset: '70%' });

		$('section.staff').waypoint(function() {
			setTimeout(function() {
				$('section.staff .figure:nth-of-type(1)').addClass('animated fadeInLeft');
				$('section.staff .figure:nth-of-type(2)').addClass('animated fadeInDown');
				$('section.staff .figure:nth-of-type(3)').addClass('animated fadeInRight');
			}, 100);	
		}, { offset: '70%' });
	}


	/*--------------- isotope  ------------------*/
	if($('#list-item').length){
		$('.menu-wrapper a').on('click' , function() {
			var el = $(this);
            el.parents('.menu-wrapper').find('a').removeClass('selected');
            el.addClass('selected');
        });
        var $container = $('#list-item');
  		$container.isotope({
            itemSelector: '.figure',
            animationOptions: {
	            duration: 750,
	            easing: 'linear',
	            queue: false
            }
  		});
        $('.menu-wrapper  li a').on('click', function(e) {
            e.preventDefault();
            var filterValue = $(this).attr('data-filter');
            $container.isotope({
              	filter: filterValue
            });
        });
    
    }    

	 /*--------------- loader   ------------------*/
    
        $('.page_overlay').addClass('animated fadeOut');
        setTimeout(function(){
            $('.page_overlay').hide();
        },500);
   

    /*----------------------------------------------------*/
		/*	Animated Scroll To Anchor
		/*----------------------------------------------------*/
	$.fn.scrollTo = function( options ) {
		var settings = {
			offset : 70,       //an integer allowing you to offset the position by a certain number of pixels. Can be negative or positive
			speed : 'slow',   //speed at which the scroll animates
			override : null,  //if you want to override the default way this plugin works, pass in the ID of the element you want to scroll through here
			easing : null //easing equation for the animation. Supports easing plugin as well (http://gsgd.co.uk/sandbox/jquery/easing/)
		};

		if (options) {
			if(options.override){
				//if they choose to override, make sure the hash is there
				options.override = (override('#') !== -1)? options.override:'#' + options.override;
			}
			$.extend( settings, options );
		}

		return this.each(function(i, el){
			$(el).on('click', function(e){
				var idToLookAt;

				if ($(el).attr('href').match(/#/) !== null) {
					e.preventDefault();
					idToLookAt = (settings.override)? settings.override:$(el).attr('href');//see if the user is forcing an ID they want to use
					//if the browser supports it, we push the hash into the pushState for better linking later
					
					if(history.pushState){
						
						history.pushState(null, null, idToLookAt);

						$('html,body').stop().animate({scrollTop: $(idToLookAt).offset().top + settings.offset}, settings.speed, settings.easing);

					}else{
						//if the browser doesn't support pushState, we set the hash after the animation, which may cause issues if you use offset
						$('html,body').stop().animate({scrollTop: $(idToLookAt).offset().top + settings.offset}, settings.speed, settings.easing,function(e){
							//set the hash of the window for better linking
							//window.location.hash = idToLookAt; //[COMMENTED OUT TO DISABLE JUMPING IN IE]
						});
					}
				}
			});
		});
	};
	  
	$('.GoToHome, .GoToAbout, .GoToSermons, .GoToGallery, .GoToBlog, .GoToEvent, .GoToStore, .GoToContact' ).scrollTo({ speed: 1400 });
	/*---------------- one page menubar after ----------------*/	
	// $('.menubarOne li a').on('click' , function(){
	// 	$('.menubarOne li a').removeClass('active');
	// 	$(this).addClass('active');
	// });

	/*----------------------video resizer ------------------------*/
	var container = document.getElementById('embed_container');
	var video = document.getElementById('video');
	var ratio = 9/16; //this is why the 56.25% padding hack exists

	function resizer() {
	    var width = parseInt(window.getComputedStyle(container)['width'], 10);
	    var height = (width * ratio);
	    
	    video.style.width = width + 'px';
	    video.style.height = height + 'px';
	    video.style.marginTop = '-3.278%'; //~732px wide, the video border is about 24px thick (24/732)
	    
	    container.style.height = (height * 0.88) + 'px'; //0.88 was the magic number that you needed to shrink the height of the outer container with.
	}

	//container.style.padding = 0;
	if ($('#embed_container').length) {
		resizer();
		//attach event on resize
		window.addEventListener('resize', resizer, false);
	}

	/* One Page Layout ScrollSpy */

	$('[data-spy="scroll"]').each(function () {
  		var $spy = $(this).scrollspy('refresh')
	});

	/* ------------- event -----------*/
	$('.tab_eventSection a').on('click',function (event) {
		event.preventDefault();
		var target = $(this).attr('href');
		if (target==='#') {
		}else {
			$('.tab_eventSection li').removeClass('active');
			$(this).parent().addClass('active');
			$('.event_montlydetails .tab-pane').hide();
			$(target).show();
		}
	});

	/*-  ------------ calender function ----------- */
	if ($('#calendar').length){

		var crossEvents = {
			'09-16-2015': [
				{content: '<span>John Applesed\'s Birthday</span>', allDay: true},
				{content: '<span>Arnold Mathew\'s Birthday</span>', allDay: true},
				{content: '<span>Captain X\'s Birthday</span>', allDay: true}
			],
			'09-17-2015': [
				{content: '<span>John Applesed\'s Birthday</span>', allDay: true},
				{content: '<span>Arnold Mathew\'s Birthday</span>', allDay: true},
				{content: '<span>Captain X\'s Birthday</span>', allDay: true}
			],
			'09-18-2015': [
				{content: '<span>John Applesed\'s Birthday</span>', allDay: true},
				{content: '<span>Arnold Mathew\'s Birthday</span>', allDay: true},
				{content: '<span>Captain X\'s Birthday</span>', allDay: true}
			],
			'09-19-2015': [
				{content: '<span>John Applesed\'s Birthday</span>', allDay: true},
				{content: '<span>Arnold Mathew\'s Birthday</span>', allDay: true},
				{content: '<span>Captain X\'s Birthday</span>', allDay: true}
			],
			'09-29-2015': [
				{content: '<span>Birthday</span>', allDay: true},
				{content: '<span>Birthday</span>', allDay: true},
				{content: '<span>Captain X\'s Birthday</span>', allDay: true}
			]
		};

		var cal = $( '#calendar' ).calendario({
				displayWeekAbbr : true,
				caldata : crossEvents,
				events: 'mouseenter, mouseleave',
				onDayMouseenter : function( $el, data, dateProperties ) {
					var item = $('.eventday-'+dateProperties.day),
						parent = $('.events-name');
					item.addClass('animated');
					if(item.position()){
					    if(item.position().top < parent.scrollTop()){
					        //scroll up
					        parent.animate({scrollTop:item.position().top}, 1000);
					    }
					    else if(item.position().top + item.height() > parent.scrollTop() + parent.innerHeight()){
					        //scroll down
					        parent.animate({scrollTop:item.position().top - parent.innerHeight() + item.height() + 15}, 1000);
					    }
					}
                },
				onDayMouseleave : function( $el, data, dateProperties ) {
					$('.eventday-'+dateProperties.day).removeClass('animated');
                }
			});
		var $month = $( '#current_month' ).html( cal.getMonthName() )
		var $year =$( '#current_yr' ).html( cal.getYear() )
		
		function updateMonthYear() {				
			$month.html( cal.getMonthName() );
			$year.html( cal.getYear() );
		}
		$( '#next_yr' ).on( 'click', function() {
		    cal.gotoNextMonth( updateMonthYear );
		    updateEvents();
		} );
		$( '#prev_yr' ).on( 'click', function() {
		    cal.gotoPreviousMonth( updateMonthYear );
		    updateEvents();
		} );

		var eventWrap = $('.dynamic-event');
		updateEvents();

	}
	
	function updateEvents(){
		eventWrap.empty();
		$.each(crossEvents, function(key, val){
	        var month = parseInt(key.substring(0,2)),
	        	day = parseInt(key.substring(3,5));
	        if(month === cal.getMonth()){
	        	for (var i = 0; i < val.length; i++) {
	        		eventWrap.append('<li class="eventday-' + day + '">' + val[i].content + '</li>');
	        	}
	        }else{
	        	eventWrap.html('There are no events in this month');
	        }
		});
	}

	/* ----------- slim scroll -----------*/
	if($('.scrollbar').length){
	    $('.scrollbar').slimScroll({
	        alwaysVisible: false,
	        railVisible: false,
	        size: '0px',
	    });
	 
	}

});


