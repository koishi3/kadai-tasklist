class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks=Task.order(deadline: :asc).page(params[:page]).per(10)
  end

  def show
    set_task
  end

  def new
    @task=Task.new
  end

  def create
    @task=Task.new(task_params)
    
    if @task.save
      flash[:success]='無事リストに追加されました！'
      redirect_to @task
    else
      flash.now[:danger]='追加できませんでした。。'
      render :new
    end
  end

  def edit
    set_task
  end

  def update
    set_task
    
    if @task.update(task_params)
      flash[:success]='タスクが更新されました'
      redirect_to @task
    else
      flash.now[:danger]='タスクは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    set_task
    @task.destroy
    
    flash[:success]='タスクが削除されました'
    redirect_to tasks_url
  end
  
  private
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status)
  end
  
  # Common
  def set_task
    @task=Task.find(params[:id])
  end
  
end
