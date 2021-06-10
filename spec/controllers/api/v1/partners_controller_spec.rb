describe Api::V1::PartnersController, type: :controller do
  describe 'POST match' do
    let(:address) { Faker::Address.full_address }
    let(:floor_material) { Partner::ALLOWED_FLOORING_MATERIALS.sample }
    let(:floor_meters) { Faker::Number.within(range: 10..30) }
    let(:phone) { Faker::PhoneNumber.cell_phone_with_country_code }

    it 'returns partners' do
      params = {
        address: address,
        floor_material: floor_material,
        floor_meters: floor_meters,
        phone: phone
      }

      allow(MatchPartners).to receive(:call).with(address, floor_material).and_return([])

      post :match, params: params

      expect(response).to have_http_status(:ok)
    end
  end
end
