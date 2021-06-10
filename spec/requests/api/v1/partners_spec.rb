require 'swagger_helper'

describe 'api/v1/partners', type: :request do
  path '/api/v1/partners/match' do
    parameter name: 'address', in: :query, type: :string, description: 'Address'
    parameter name: 'floor_material', in: :query, type: :string,
              description: "Material for the floor (#{Partner::ALLOWED_FLOORING_MATERIALS.join(', ')})"
    parameter name: 'floor_meters', in: :query, type: :integer, description: 'Square meters of the floor'
    parameter name: 'phone', in: :query, type: :string, description: 'Phone number'

    post('match partners') do
      let!(:partner) { create :partner }
      let(:partner_data) do
        {
          address: partner.address,
          flooring_materials: partner.flooring_materials,
          operating_radius: 10,
          rating: partner.rating
        }
      end

      before do
        allow(MatchPartners).to receive(:call).and_return([partner_data])
      end

      response 200, 'successful' do
        let(:address) { Faker::Address.full_address }
        let(:floor_material) { Partner::ALLOWED_FLOORING_MATERIALS.sample }
        let(:floor_meters) { Faker::Number.within(range: 10..30) }
        let(:phone) { Faker::PhoneNumber.cell_phone_with_country_code }

        run_test! do
          requests_rswag_example

          expect(responses_json).to include(partner_data)
        end
      end
    end
  end
end
