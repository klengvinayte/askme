class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\Z/i }

  validates :nickname,
            presence: true,
            uniqueness: true,
            length: { maximum: 40 },
            format: { with: /\A\w+\Z/ }

  def downcase_nickname
    nickname.downcase!
  end
end
