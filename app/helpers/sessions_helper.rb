module SessionsHelper
  attr_reader :current_user

  def log_in user
    session[:user_id] = user.id
  end

  def remember user
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    return current_user ||= User.find(session[:user_id]) if user_id = session[:user_id]
    return unless user_id = cookies.signed[:user_id]

    user = User.find user_id
    return unless user&.authenticated? :remember, cookies[:remember_token]

    log_in user
    current_user = user
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    forget current_user
    session.delete :user_id
    current_user = nil
  end

  def forget _user
    cookies.delete :user_id
    cookies.delete :remember_token
  end
end
