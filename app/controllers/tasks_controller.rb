class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy task_completion]

  # GET /tasks or /tasks.json
  def index
    # the below line loads all tasks for the current user which are not complete
    @tasks = current_user.tasks.where(completed: false) 
  end

  # GET /tasks/1 or /tasks/1.json
  def show
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
    @task.user = current_user
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "A new task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
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
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def task_completion
    @task.update(completed: true)
    redirect_to tasks_url, notice: "Task moved to completed list." 
  end

  def completed_tasks
      # Here we are loading all the current user's tasks which are completed
      @tasks = current_user.tasks.where(completed: true)     
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])   
    # The below two lines handle the exception whenever user tries to find a task that does not exist
    rescue ActiveRecord::RecordNotFound
      redirect_to tasks_path, notice: "The task you are looking for does not exist"
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:user_id, :completed, :task_name, :category, :priority)
    end
end
