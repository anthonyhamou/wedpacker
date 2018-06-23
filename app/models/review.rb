class Review < ApplicationRecord
  belongs_to :supplier
  belongs_to :user
  validates :rating, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }, numericality: { only_integer: true }
  validates :content, length: { minimum: 10 }
end
