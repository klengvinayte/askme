class Tag < ApplicationRecord
  has_many :question_tags, dependent: :destroy
  has_many :questions, through: :question_tags

  scope :with_questions, -> { joins(:question_tags).distinct }

  REGEX = /#[[:word:]-]+/

  def to_param
    name
  end
end
