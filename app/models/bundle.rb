class Bundle < ApplicationRecord
  belongs_to :user
  has_many :bundle_lines
  has_many :suppliers, through: :bundle_lines
  monetize :amount_cents
  validates :state, inclusion: { in: ['pending', 'cancelled', 'paid', 'confirmed', 'refunded', 'completed'] }

  attr_accessor :supplier_ids
  # confirmed = payment accpeted + boooking confirmed
  # cancelled = after payment if user wants to retract
  # completed = after wedding when user wants to add a review
end
