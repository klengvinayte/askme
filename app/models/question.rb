class Question < ApplicationRecord

  validates :body,
            length: { minimum: 4, maximum: 280 }
end
