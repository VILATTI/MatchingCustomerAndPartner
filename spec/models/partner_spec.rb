describe Partner, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:address) }

    it { is_expected.to validate_presence_of(:flooring_materials) }

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

  context 'with methods' do
    describe '#by_address_and_floor_material' do
      let(:floor_material) { Partner::ALLOWED_FLOORING_MATERIALS.first }
      let(:customer_address) { '195 Broadway, New York, NY 10007' }
      let!(:partner_with_bad_rating) do
        create :partner, rating: 1.5, address: '120 Broadway, New York, NY 10271', flooring_materials: [floor_material]
      end
      let!(:partner_with_good_rating) do
        create :partner, rating: 4.9, address: '70 Broad St, New York, NY 10004', flooring_materials: [floor_material]
      end
      let!(:partner_with_long_distance) do
        create :partner, rating: 4.5, address: '200 W 143rd St, New York, NY 10030',
                         flooring_materials: [floor_material]
      end

      before do
        # this partmer should not appear in the list
        create :partner, address: customer_address, flooring_materials: [Partner::ALLOWED_FLOORING_MATERIALS.last]
      end

      it 'gets correct partners list sorted by rating' do
        result = described_class.by_address_and_floor_material(customer_address, floor_material)

        expect(result).to eq([partner_with_good_rating, partner_with_long_distance, partner_with_bad_rating])
      end
    end
  end
end
