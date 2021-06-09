class Partner < ApplicationRecord
  ALLOWED_FLOORING_MATERIALS = %w[wood carpet tiles].freeze
  MIN_RATING = 1.0
  MAX_RATING = 5.0

  validates :address, presence: true
  validates :flooring_materials, presence: true
  validates :operating_radius_km, presence: true, numericality: { only_integer: true }
  validates :rating, presence: true,
                     numericality: { greater_than_or_equal_to: MIN_RATING, less_than_or_equal_to: MAX_RATING }

  validate :flooring_materials_validity, if: :flooring_materials

  private

  def flooring_materials_validity
    return if (unknown_materials = flooring_materials - ALLOWED_FLOORING_MATERIALS).empty?

    message = "Unknown materials: #{unknown_materials.join(', ')}, "\
              "allowed keywords: #{ALLOWED_FLOORING_MATERIALS.join(', ')}"
    errors.add(:flooring_materials, message)
  end
end
