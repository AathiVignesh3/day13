require 'rails_helper'

RSpec.describe "Tasks", type: :request do

   it "task path" do
    get "/tasks"
   expect(response).to render_template("tasks/index")
   end

   it "task new" do
    get "/tasks/new"
   expect(response).to render_template("tasks/new")
   end

   it "task Edit" do
    task = Task.new
    task.id=1
    task.name="Day 13"
    task.due_date=DateTime.now +1.week
    task.status=false
    task.created_at=DateTime.now
    task.updated_at=DateTime.now
    task.user_id=39
    task.save
    get "/tasks/1/edit"
    expect(response).to render_template('tasks/edit')
   end
  
end
