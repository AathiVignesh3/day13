class DuedateJob < ApplicationJob
  queue_as :default

  # def perform(task)
  #   user = User.find_by_id(task.user_id)
  #   if task.due_date<Time.now
  #   UserMailer.with(user: user,task: task).task_duedate.deliver_now
  #   end
  # end
end
