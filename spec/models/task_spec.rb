require 'rails_helper'

RSpec.describe Task, type: :model do
  task = Task.new
  user = User.new 
context "Checking the user" do 
  it "validate User" do
    user.email = "aathivignesh222@gmail.com"
    user.password = "90803466"
    expect(user).to be_valid
  end
end

  context "task create" do
    it "Validate Task" do
      task.name ="Ruby"
      task.due_date = DateTime.now + 1.week
      task.status = false
      task.user_id = 39
      task.save
      expect(task).to be_valid
    end
  end

  context "task update" do
    it "update task" do 
      task.update(status: true)
      expect(task).to be_valid
    end
  end
  task.save
  context "tast Read" do 
  it "Read task" do
      expect(task).to be_valid
  end
  end

end
