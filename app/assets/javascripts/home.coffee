# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.fa.fa-bars').click ->
	  $('nav').addClass 'open'
	  return

	$('.fa.fa-times').click ->
	  $('nav').removeClass 'open'
	  return  

	fade_out = ->
    $('.notice').fadeOut().empty()
    $('.notice').attr 'style', 'z-index: -5;'
    return

  setTimeout fade_out, 2000  

  if $('.calendar-title').text() == 'Jan'
  	$('.calendar-title').text '01'
  	return
  else if	$('.calendar-title').text() == 'Feb'
  	$('.calendar-title').text '02'
  	return
  else if	$('.calendar-title').text() == 'Mar'
  	$('.calendar-title').text '03'
  	return	
  else if	$('.calendar-title').text() == 'Apr'
  	$('.calendar-title').text '04'
  	return	
  else if	$('.calendar-title').text() == 'May'
  	$('.calendar-title').text '05'
  	return	
  else if	$('.calendar-title').text() == 'Jun'
  	$('.calendar-title').text '06'
  	return	
  else if	$('.calendar-title').text() == 'Jul'
  	$('.calendar-title').text '07'
  	return	
  else if	$('.calendar-title').text() == 'Aug'
  	$('.calendar-title').text '08'
  	return	
  else if	$('.calendar-title').text() == 'Sep'
  	$('.calendar-title').text '09'
  	return	
  else if	$('.calendar-title').text() == 'Oct'
  	$('.calendar-title').text '10'
  	return	
  else if	$('.calendar-title').text() == 'Nov'
  	$('.calendar-title').text '11'
  	return	
  else if	$('.calendar-title').text() == 'Dec'
  	$('.calendar-title').text '12'
  	return	
