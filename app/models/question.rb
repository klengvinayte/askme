class Question < ApplicationRecord
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags

  validates :body,
            presence: true,
            length: { maximum: 280 }

  belongs_to :user
  belongs_to :author, class_name: "User", optional: true

  after_save_commit :update_tags

  private

  def update_tags
    self.tags =
      "#{body} #{answer}".downcase.scan(Tag::REGEX).uniq.map do |tag|
        Tag.find_or_create_by(name: tag.delete("#"))
      end
  end
end
