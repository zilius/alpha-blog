class ApplicationController < ActionController::Base
  
  def home
    redirect_to articles_path if logged_in?
  end

  # Metodas gali buti naudojamas tiek controleryje tiek view'e. Helperis pasiekia tik view
  helper_method :current_user, :logged_in?

  def current_user
    # jei yra current user grazinam, jeigu ne tada querinam
    @current_user || User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # convertinimas kintamojo i bool
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform this action"
      redirect_to login_path
    end
  end

end
