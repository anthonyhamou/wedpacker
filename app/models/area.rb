class Area < ApplicationRecord
  has_many :suppliers
  before_validation :validation_area

  def working_area
    "#{department}, #{region}, #{country}"
  end

  private

  def validation_area
    if country.nil? && region.nil? && department.nil? && city.nil?
      errors.add(:country, "Specify at least a country")
    end
  end
end
