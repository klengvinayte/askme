class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)
    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

    if user.present?
      session[:user_id] = user.id
      redirect_to root_path, notice: I18n.t("controllers.sessions.log_in")
    else
      flash.now[:alert] = I18n.t("controllers.sessions.alert")
      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: I18n.t("controllers.sessions.notice")
  end
end
