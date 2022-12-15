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
            format: { with: /\A#[\w\d]{6}\z/ }

  def downcase_nickname
    nickname.downcase!
  end
end
