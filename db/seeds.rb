Image.destroy_all
Availability.destroy_all
BundleLine.destroy_all
Supplier.destroy_all
Service.destroy_all
Area.destroy_all
Bundle.destroy_all
User.destroy_all

#CREATING A USER
puts "Creating user"
user = User.create!(first_name: "Alicia", last_name: "Yahiaoui", email: "alicia@wedpacker.party", password: "123456")
puts "User created"

# CREATING SERVICES
puts "Creating services"

@place = Service.create!(category: "lieu")
@caterer = Service.create!(category: "traiteur")
@musician = Service.create!(category: "musique")
@florist = Service.create!(category: "fleuriste")
@photograph = Service.create!(category: "photographe")
@entertainment = Service.create!(category: "animations")

puts "Services created"

# CREATING AREAS

puts "Creating areas"

@areas = Area.create!([
  {country: "France", region: nil},
  {country: "France", region: "Bourgogne-Franche-Comté"},
  {country: "France", region: "Nouvelle Aquitaine"},
  {country: "France", region: "Normandie"},
  {country: "France", region: "Grand Est"},
  {country: "France", region: "Occitanie"},
  {country: "France", region: "Hauts-de-France"},
  {country: "France", region: "Auvergne-Rhône-Alpes"},
  {country: "France", region: "Bretagne"},
  {country: "France", region: "Centre-Val de Loire"},
  {country: "France", region: "Corse"},
  {country: "France", region: "Pays de la Loire"},
  {country: "France", region: "Provence-Alpes-Côte d'Azur"},
  {country: "France", region: "Île-de-France"},
  ])

puts "Areas created"

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

puts "Finished"
