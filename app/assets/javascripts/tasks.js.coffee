class Task
  constructor: (data) ->
    @title    = ko.observable(data.title)

class TasksViewModel
  constructor:  ->
    self = this

    @tasks = ko.observableArray([])
    @newTaskTitle = ko.observable()

    $.getJSON '/tasks', (json) ->
      mappedTasks = $.map json, (item) -> new Task(item)
      self.tasks(mappedTasks)

  addTask: (form)->
    console.log ko.toJSON({ task: @tasks })
    $.ajax("/tasks", {
      data: ko.toJSON({ task: @tasks[0] }),
      type: "post", contentType: "application/json",
      success: (result) ->
        alert(result)
    });


$ ->
  ko.applyBindings(new TasksViewModel())

