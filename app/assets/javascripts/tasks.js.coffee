class TaskViewModel
  constructor: (json) ->
    @taskList = ko.observableArray(json)

$ ->
  $.getJSON('/tasks', (data) ->
    ko.applyBindings(new TaskViewModel(data))
  )

