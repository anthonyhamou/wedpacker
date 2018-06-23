class Availability < ApplicationRecord
  belongs_to :supplier
  validates :starts_on, :ends_on, presence: true
end
