module SessionsHelper
  def current_user
    if session[:userprof].present?
      @user9487 ||= User.find_by(id: session[:userprof])
    else
      nil
    end
  end
end
