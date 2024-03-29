class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit]
  before_action :set_question_for_current_user, only: %i[edit update destroy hide]

  def create
    question_params = params.require(:question).permit(:body, :user_id, :author_id)

    @question = Question.new(question_params)

    @question.author = current_user

    if @question.save

      redirect_to user_path(@question.user.nickname), notice: I18n.t("controllers.questions.new")
    else
      @user = User.find(question_params[:user_id])

      flash.now[:alert] = I18n.t("controllers.questions.notice")

      render :new
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)

    if @question.update(question_params)

      redirect_to user_path(@question.user), notice: I18n.t("controllers.questions.notice2")
    else
      flash.now[:alert] = I18n.t("controllers.questions.alert")

      render :new
    end
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: I18n.t("controllers.questions.delete")
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.order(created_at: :desc).last(10)
    @users = User.order(created_at: :desc).last(10)
    @tags = Tag.with_questions.order(:name)
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def edit
  end

  def hide
    @question.toggle!(:hidden)
    redirect_to questions_path
  end

  def author
    User.find[:author_id] if author_id.present?
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
