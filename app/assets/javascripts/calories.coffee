# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

	Morris.Line
  	element: 'calories_chart'
  	data: $('#calories_chart').data('calories')
  	xkey: 'date'
  	ykeys: ['gained_number', 'burned_number']
  	labels: ['Gained calories', 'Burned calories']
  	hideHover: 'auto'