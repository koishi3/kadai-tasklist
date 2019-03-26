module SessionsHelper
  # SessionsHelperのようなhelpersディレクトリの中のモジュールを、ヘルパーモジュールという。
  # ヘルパーモジュールに書かれたメソッドは無条件で、全てのビューで使える。
  def current_user
    @current_user ||=User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end
end
