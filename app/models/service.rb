class Service < ApplicationRecord
  CATEGORIES = ["lieu", "traiteur", "musique", "photographe", "fleuriste", "animations"]
  has_many :suppliers
  validates :category, inclusion: { in: CATEGORIES }
end
