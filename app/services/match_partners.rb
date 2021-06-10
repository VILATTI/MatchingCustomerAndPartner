class MatchPartners
  def self.call(address, floor_material)
    Partner.by_address_and_floor_material(address, floor_material).map do |partner|
      {
        name: partner.name,
        address: partner.address,
        rating: partner.rating,
        distance: partner.distance
      }
    end
  end
end
