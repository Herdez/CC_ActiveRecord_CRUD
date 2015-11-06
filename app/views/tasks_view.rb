class TasksView
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario

  #all tasks are displayed with 'X' when they are completed
	def index(all_tasks)
    all_tasks.each_with_index do |task, index|
      if task.completed == true
        char_x = "X" 
      else
        char_x = " " 
      end
      puts "#{index+1}. [#{char_x}] #{task.name}"
    end
	end

  #it returns a feedback with name task, when add a task
  def get_name(name)
    puts "Agregaste la tarea: #{name} a tu lista."
  end

  #'message_save' is displayed
  def message_save
    puts "Your task has been saved"
  end

  #'message_delete' is displayed
  def message_delete
    puts "Your task has been deleted"
  end
  
  #it returns a feedback with name task, when delete & complete
  def show_name(name, num_task)
    if num_task == 1
      puts "Eliminaste la tarea: #{name} de tu lista."
    else
      puts "Completaste la tarea: #{name}."
    end
  end

  #'message_update' is displayed
  def message_update
    puts "Your task has been updated"
  end

end
