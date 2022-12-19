class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :nickname,
            presence: true,
            uniqueness: true,
            length: { maximum: 40 },
            format: { with: /\A\w+\Z/ }

  validates :color,
            format: { with: /\A#[[:xdigit:]]{3,6}\z/ }

  has_many :questions, dependent: :delete_all
  has_many :author_id, class_name: 'Question', dependent: :nullify

  def downcase_nickname
    nickname.downcase!
  end
end
