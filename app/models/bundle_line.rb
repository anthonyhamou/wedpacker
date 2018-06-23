class BundleLine < ApplicationRecord
  monetize :amount_cents
  belongs_to :supplier
  belongs_to :bundle

end
