class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy show]
  before_action :authorize_user, only: %i[edit update destroy]

  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to root_path, notice: I18n.t("controllers.users.notice")
    else
      flash.now[:alert] = I18n.t("controllers.users.alert")

      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)

      redirect_to root_path, notice: I18n.t("controllers.users.notice2")
    else
      flash.now[:alert] = I18n.t("controllers.users.alert2")

      render :edit
    end
  end

  def destroy
    @user.destroy
    session.delete(:user_id)

    redirect_to root_path, notice: I18n.t("controllers.users.notice3")
  end

  def show
    @questions = @user.questions.order("created_at DESC")

    @questions = @user.questions
    @question = Question.new(user: @user)
  end

  private

  def authorize_user
    redirect_with_alert unless current_user == @user
  end

  def set_user
    @user = User.find_by!(nickname: params[:nickname])
  end

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password, :password_confirmation, :color
    )
  end
end
