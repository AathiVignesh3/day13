class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  helper_method :all
  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end


  def task_mailer
    @user = User.all
    byebug
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end
  
  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    @task.name.capitalize! 
    @user = User.find_by_id(@task.user_id)
    puts @user.inspect
    if Task.where(name:@task.name).count>0
      respond_to do |format|
        format.html { redirect_to tasks_path(@task), notice:["Task was Already Exist", 0] }
      end
    else
      
    respond_to do |format|
      if @task.save
        UserMailer.with(user: @user,task: @task).task_assigned.deliver_now
        format.html { redirect_to task_url(@task), notice:["Task was successfully created.", 1] }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    @user = User.find_by_id(@task.user_id)
    respond_to do |format|
      if @task.update(task_params)
        UserMailer.with(user: @user,task: @task).task_assigned.deliver_now
        format.html { redirect_to task_url(@task), notice: ["Task was successfully updated.", 1] }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: ["Task was successfully destroyed.", 0] }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :due_date, :status, :user_id)
    end
end
