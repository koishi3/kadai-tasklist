class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # 通常ヘルパーモジュールはコントローラー内では使えない。
  # include SessionsHelperを使うことで、そのメソッドをインスタンスメソッドとして読み込んでいる（コピペ）。
  # include ～のことをMix-inという。Lesson5-11。extend
  # Mix-in: moduleにまとめたmethodsをクラスで取り込むこと include (module_name)
  # ApplicationControllerに書くことで、それを継承している全てのコントローラー内でもそのヘルパーモジュールの定義を使用することができる。
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_tasks=user.tasks.count
  end
  
end