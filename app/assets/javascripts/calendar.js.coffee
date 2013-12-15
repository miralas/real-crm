# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready page:load", ->
  $("#calendar").fullCalendar(
    weekMode: "liquid"
    firstDay: 1
    timeFormat: "HH:mm{ - HH:mm} "
    
    eventSources: [
      url: $("#calendar").attr("account_path") + "/tasks/",
      color: "green",
      textColor: "black",
      ignoreTimezone: false
    ]
    
    eventClick: (event) ->
      window.open event.url, "_self" if event.url

    dayClick: (date, allDay, jsEvent, view) ->
      window.open $("#calendar").attr("account_path") + "/tasks/new?date=" + date, "_self"
  )