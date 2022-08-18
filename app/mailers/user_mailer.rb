class UserMailer < ApplicationMailer

def task_assigned
    @user = params[:user]
    @task = params[:task]
    mail(to: @user.email,subject:"Task Assigned")
end

def task_updated
    @user = params[:user]
    @task = params[:task]
    mail(to: @user.email,subject:"Task updated")
end


end