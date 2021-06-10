describe MatchPartners do
  let!(:partner) { create :partner, address: 'C. de Atocha, 6, 28012 Madrid' }

  it 'fetch partners and return serialized list' do
    allow(Partner).to receive(:by_address_and_floor_material).and_return(
      Partner.near(partner.address)
    )

    result = described_class.call(partner.address, partner.flooring_materials.first)

    expect(result).to eq(
      [
        {
          name: partner.name,
          address: partner.address,
          rating: partner.rating,
          distance: 0.0
        }
      ]
    )
  end
end
