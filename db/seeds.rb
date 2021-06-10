if Partner.none?
  addresses = [
    'Seefelder Str. 50, 13053 Berlin',
    'Krossener Str., 10245 Berlin',
    'Oppelner Str. 34, 10997 Berlin',
    'Alexandrinenstraße 49-119, 10179 Berlin',
    'Stauffenbergstraße 18, 10785 Berlin',
    'Wilsnacker Str. 63-66, 10559 Berlin',
    'Wöhlertstraße 1-10, 10115 Berlin',
    'Husemannstraße 35-17, 10435 Berlin',
    'Pufendorfstraße 7, 10249 Berlin',
    'Hinter der Katholischen Kirche 1, 10117 Berlin',
    'Parochialstraße 2, 10179 Berlin'
  ]

  addresses.each do |address|
    FactoryBot.create :partner, address: address
    puts "Partner with address: '#{address}' created."
  end
end
