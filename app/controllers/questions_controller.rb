class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy hide]

  def create
    question = Question.create(question_params)

    if question.save

      redirect_to question_path(question), notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = "Поле 'Вопрос' не должно быть пустым и должно содержать не более 280 знаков"

      render :new

    end
  end

  def update
    if @question.update(question_params)

      redirect_to question_path(@question), notice: 'Изменения сохранены'
    else
      flash.now[:alert] = "Не удалось сохранить изменения"

      render :new
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Вопрос удален'
  end

  def show
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def hide
    @question.toggle!(:hidden)
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
