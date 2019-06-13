# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.hamburger').click ->
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


  $('.change-button').click ->
    $('.change-password').css 'display', 'block'
    $('.password-question').css 'display', 'none'
    return

  $('.admin_user_password').click ->
    $('.admin_user_password').removeClass 'disabled'
    $('.password').removeClass 'disabled'
    $('#admin_user_password').removeAttr 'disabled'
    return  


  if $('#event_recurring').val() == 'null'
    console.log 'Recurring is null'
    $('.event_end_date').hide()
    $('#event_recurring').change ->
      if $(this).val() != 'null'
        console.log 'Recurring is not null now'
        $('.event_end_date').show()
      else
        console.log 'Recurring is null now'
        $('.event_end_date').hide()
      return 
  else
    console.log 'Recurring is not null'
    $('.event_end_date').show()
    $('#event_recurring').change ->
      if $(this).val() != 'null'
        console.log 'Recurring is not null now'
        $('.event_end_date').show()
      else
        console.log 'Recurring is null now'
        $('.event_end_date').hide()
      return
  return  

  $("input.date_picker").datepicker();



