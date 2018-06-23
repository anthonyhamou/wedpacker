puts "Creating availabilities"

supplier_types = [@places, @photographs, @caterers, @entertainments]

supplier_types.each do |suppliers|
  suppliers.each do |supplier|
    Availability.create!(starts_on: "2018-06-29", ends_on: "2018-09-16", supplier: supplier)
  end
end

puts "Availabilities created"
