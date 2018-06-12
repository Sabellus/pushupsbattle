module UserHelper
  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def current_user?
    !!current_user
  end
  def cur_user?(user)
    user == current_user
  end

  def guest?
    !current_user
  end

end
