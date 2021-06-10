class Partner < ApplicationRecord
  ALLOWED_FLOORING_MATERIALS = %w[wood carpet tiles].freeze
  MIN_RATING = 1.0
  MAX_RATING = 5.0

  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true
  validates :address, presence: true
  validates :flooring_materials, presence: true
  validates :rating, presence: true,
                     numericality: { greater_than_or_equal_to: MIN_RATING, less_than_or_equal_to: MAX_RATING }

  validate :flooring_materials_validity, if: :flooring_materials

  def self.by_address_and_floor_material(address, floor_material)
    Partner.where('? = ANY (flooring_materials)', floor_material).near(address).reorder('rating DESC, distance ASC')
  end

  private

  def flooring_materials_validity
    return if (unknown_materials = flooring_materials - ALLOWED_FLOORING_MATERIALS).empty?

    message = "Unknown materials: #{unknown_materials.join(', ')}, "\
              "allowed keywords: #{ALLOWED_FLOORING_MATERIALS.join(', ')}"
    errors.add(:flooring_materials, message)
  end
end
