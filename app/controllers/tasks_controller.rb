class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  #before_action :check_user, only: [:show, :edit, :update, :destroy]
  
  def show
  #rescue ActiveRecord::RecordNotFound
  #redirect to root_url
  #存在しないidのページはエラーとしても良さそうとのことでした
  #他の書き方(private>correct_user)
  
  
    # models/task.rbにbelongs_to :userがあるので、下記のように記載すれば、当該taskの作成者が取得できる
    # if @task.user != current_user
    #   redirect_to "http://www.yahoo.co.jp/"
    # end
    # 後置if
    # redirect_to root_url if @task.user != current_user
  end
  
  def new
    @task=Task.new
  end

  def create
    @task=current_user.tasks.build(task_params)
    if @task.save
      flash[:success]='新しくリストを追加しました！'
      redirect_to root_url
    else
      flash.now[:danger]='タスクの追加に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success]='タスクが更新されました'
      redirect_to root_url
    else
      flash.now[:danger]='タスクは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    flash[:success]='タスクが削除されました'
    redirect_to root_path
  end
  
  private
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status)
  end
  
  #def check_user
    #redirect_to root_url if @task.user != current_user
  #end
  
  # Correct User for Destroy
  def correct_user
    @task=current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
  #currect_userの別の書き方(かつ例外処理(↑のコメントアウト)ではない書き方)
  #def currect_user
    #@task=Task.find_by(id: params[:id]) #存在しない場合は@taskにnilが入る
    #return redirect_to root_url unless @task
    #redirect_to root_url if @task.user != current_user
  #end
  
end
