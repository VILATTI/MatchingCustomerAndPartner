FactoryBot.define do
  factory :partner do
    address { Faker::Address.full_address }
    operating_radius_km { Faker::Number.between(from: 1, to: 100) }
    rating { Faker::Number.between(from: 1.0, to: 5.0) }
    flooring_materials do
      Partner::ALLOWED_FLOORING_MATERIALS.sample(1 + rand(Partner::ALLOWED_FLOORING_MATERIALS.length))
    end
  end
end
