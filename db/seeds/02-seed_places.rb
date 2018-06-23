# CREATING PLACES
puts "Creating Places"
array_suppliers = [
  {
    service_name: "Château d'Azy",
    description: "Vivez votre part de rêve dans l'enceinte idyllique d'un Château à taille humaine.
    Le Château d’Azy vous ouvre ses portes et devient votre demeure le temps d'un weekend, afin de célébrer votre mariage et recevoir vos invités dans un cadre prestigieux et champêtre.
    Entre l'authenticité d'une demeure classée monument historique au chic néo-contemporain, l'excellence des équipements, son charme si particulier de son architecture Renaissance, le domaine d'Azy sera le théâtre de votre réception.",
    price: 1900,
    avg_rating: 4.9,
    originality: "Les 45 hectares de parc, les terrasses et pelouses, les arbres centenaires, la vue panoramique dominante sur la campagne nivernaise.",
    capacity: 180,
    address: "Château d'Azy, 58270 Saint-Benin-d'Azy",
    service: @place,
  },
  {
    service_name: "Domaine de Chaligny",
    description: "Le domaine de Chaligny est un établissement de caractère qui offre un cadre princier pour la célébration de vos noces. Venez découvrir ce joyau situé dans la Nièvre dont la beauté des lieux achèvera de vous convaincre.
    Le parc de 13 hectares orné d'arbres majestueux, bicentenaires, offrira un cadre champêtre à vos manifestations et ne manquera pas de ravir vos convives. Les salons de jardin du Domaine sont également mis à disposition, et il est possible d'installer des chapiteaux dans le parc.",
    price: 1600,
    avg_rating: 4.9,
    originality: "La piscine couverte, ouverte en journée.",
    capacity: 150,
    address: "Domaine de Chaligny, Chaligny, 58120 Saint-Hilaire-en-Morvan",
    service: @place,
  },
  {
    service_name: "La Closeraie",
    description: "Au cœur du Charolais, La Closeraie vous offre un cadre de rêve pour organiser votre mariage. Vos convives seront charmés par cette ancienne ferme entièrement rénovée, située à Volesvres en Saône et Loire, à une heure de Mâcon.
    La Closeraie est dotée d'une vaste salle au charme spectaculaire où vous pourrez accueillir un grand nombre d'invités. Elle dispose également d'une charmante terrasse qui se prêtera parfaitement à l'organisation de votre cocktail.",
    price: 1200,
    avg_rating: 4.6,
    originality: "Le charme bucolique d'un ancien corps de ferme entièrement rénové.",
    capacity: 200,
    address: "Les Places, 71600 Volesvres, 71600 Volesvres",
    service: @place,
  }
]

@places = []
array_suppliers.each do |supplier|
  new_supplier = Supplier.new(supplier)
  new_supplier.area = Area.where(region: "Bourgogne-Franche-Comté").first
  new_supplier.save!
  @places << new_supplier
end

puts "Places created"
