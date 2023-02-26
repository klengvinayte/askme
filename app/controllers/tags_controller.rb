class TagsController < ApplicationController
  def show
    @tag = Tag.find_by!(name: params[:name])

    if
      @tag.questions.empty?
      redirect_to root_path, notice:  "#{I18n.t("controllers.tags.info")} ##{@tag.name}"
    else
      @questions = @tag.questions.order(created_at: :desc)
    end
  end
end
