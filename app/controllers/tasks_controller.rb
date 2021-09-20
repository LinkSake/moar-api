class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    project_id = params[:project_id]

    @tasks = Task.where(project_id: project_id)
    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  # GET /tasks/1/start
  def start
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    if @project.tasks.where(running: true).count == 0
      @task.update(running: true, start: DateTime.now.strftime("%Y-%m-%d %H:%M:%S"))
      render json: @task
    else
      render json: {error: "There is already a running task in this project"}, status: :unprocessable_entity
    end
  end

  # GET /tasks/1/stop
  def stop
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    if @project.tasks.where(running: true).count == 1
      @task.update(running: false, end: DateTime.now.strftime("%Y-%m-%d %H:%M:%S"))
      render json: @task
    else
      render json: {error: "There is not a task running in this project"}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :running, :start, :end, :project_id)
    end
end
