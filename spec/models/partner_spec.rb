describe Partner, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:address) }

    it { is_expected.to validate_presence_of(:flooring_materials) }

    it { is_expected.to validate_presence_of(:operating_radius_km) }
    it { is_expected.to validate_numericality_of(:operating_radius_km).only_integer }

    it { is_expected.to validate_presence_of(:rating) }
    it { is_expected.to validate_numericality_of(:rating).is_greater_than_or_equal_to(Partner::MIN_RATING) }
    it { is_expected.to validate_numericality_of(:rating).is_less_than_or_equal_to(Partner::MAX_RATING) }

    it 'validates flooring materials to be allowed' do
      partner = build :partner, flooring_materials: ['wrong_material']

      expect(partner).not_to be_valid
      error_message = "Unknown materials: #{partner.flooring_materials.first}, "\
                      "allowed keywords: #{Partner::ALLOWED_FLOORING_MATERIALS.join(', ')}"
      expect(partner.errors.messages[:flooring_materials]).to eq([error_message])
    end
  end
end
