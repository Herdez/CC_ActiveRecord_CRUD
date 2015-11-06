#This is a 'CRUD' program for tasks. In other words is 
#a 'to-do list'

#It is class that controls 'view' and 'model'
class TasksController
  #initialized instance '@view'
  def initialize(args)
    @view = TasksView.new
    run(args)
  end

  #This method operate interaction between 'view' and 'model'
  #through methods.
  def run(args)
    task = args
    task_name = "#{task[1..-1].join(" ")}"
    case task[0] 
      when "add" then add(task_name)
      when "index" then index
      when "delete" then delete(task_name)
      when "complete" then complete(task_name)
    end
  end

  #Read index from 'all_task'
  def index
    all_tasks = Task.all  
    @view.index(all_tasks)
  end

  #it returns the name task selected
  def get_index(num)
    task_name = " "
    list = Task.all
    list.each_with_index do |task, index|
      task_name = task.name if index+1 == num.to_i 
    end
    task_name
  end

  #It call to get name from task
  def get_name(task_name)
    @view.get_name(task_name)
  end

  #It adds tasks
  def add(task_name)
    get_name(task_name)
    Task.create!(name: task_name, completed: false)
    @view.message_save
  end

  #Delete selected task
  def delete(num)
    list = Task.all
    show_task = get_index(num)
    list.each_with_index do |task, index|
      task.destroy if index+1 == num.to_i 
    end
    @view.show_name(show_task, 1)
  end

  #It updates selected task
  def complete(num)
    list = Task.all
    show_task = get_index(num)
    list.each_with_index do |task, index|
      task.update(completed: true) if index+1 == num.to_i 
    end
    @view.show_name(show_task, 2)
    @view.index(list)
    @view.message_update
  end
end
