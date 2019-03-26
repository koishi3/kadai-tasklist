class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # 通常ヘルパーモジュールはコントローラー内では使えない。
  # include SessionsHelperを使うことで、そのメソッドをインスタンスメソッドとして読み込んでいる（コピペしているようなもの）。
  # include ～のことをMix-inという。Lesson5-11に説明がある。extend
  # ApplicationControllerに書くことで、それを継承している全てのコントローラー内でもそのヘルパーモジュールの定義を使用することができる。
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
