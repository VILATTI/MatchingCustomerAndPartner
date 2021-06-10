FactoryBot.define do
  factory :partner do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    rating { Faker::Number.between(from: 1.0, to: 5.0) }
    flooring_materials do
      Partner::ALLOWED_FLOORING_MATERIALS.sample(1 + rand(Partner::ALLOWED_FLOORING_MATERIALS.length))
    end
  end
end
