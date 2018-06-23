puts "Starting to create Caterers"

array_caterers = [
  {
    owner: "Jerôme Sanchez",
    service_name: "JS Traiteur",
    description: "Pour faire de votre banquet de noces la réception qui se doit, faites appel à des professionnels de la gastronomie avec JS Traiteur.
      C'est une cuisine savoureuse et raffinée qui est la marque de cette maison. Travaillant uniquement des matières premières de grande qualité et des produits frais, la brigade vous régalera avec de merveilleux buffets chauds et froids composés de verrines, bouchées et autres délices, et des plats de gastromie française et d’ailleurs",
    price: 50,
    avg_rating: 4.7,
    originality: "Réalisant une prestation sur-mesure pour vous offrir ce dont vous rêvez, ce traiteur d'exception saura être à votre écoute et à vos côtés tout au long de votre collaboration.",
    service: @caterer,
    },
    {
    owner: "Didier Chapuis",
    service_name: "Festins",
    description: "Votre traiteur Festins vous offre ses services et vous propose de savourer une cuisine gastronomique de qualité.
      Membre de l'Association des Traiteurs de France, la fraîcheur et la qualité des produits utilisés par Festins vous est garantie par leur Charte de Qualité.",
    price: 70,
    avg_rating: 4.5,
    originality: "Cuisine française élaborée et gastronomique",
    service: @caterer,
    },
    {
    owner: "Philippe Queneau",
    service_name: "L'épicurien des Vignes",
    description: "Derrière ce projet et derrière les fourneaux, vous retrouverez Philippe Queneau, Maître Restaurateur. Fort de 20 ans d'expérience et formé par de grands chefs triplement étoilés, le chef saura vous proposer la prestation qui convient le mieux à vos goûts et votre budget. Pour cela il a imaginé un large choix de formules et de menus.
      Tous les produits sont rigoureusement sélectionnés par une équipe de professionnels qualifiés.
      L’efficacité de l’épicurien des Vignes n’est plus à prouver, ils vous garantissent une logistique discrète et bien réglée afin de vous permettre de profiter pleinement de vos invités.",
    price: 60,
    avg_rating: 5,
    originality: "Non seulement de delicieux cocktails sont inclus dans la formule, l’épicurien des Vignes propose également une solution globale pour votre événement du mobilier (chapitaux, pyrotechnie personnalisée, etc.).",
    service: @caterer,
    },
]

@caterers = []
array_caterers.each do |supplier|
  new_supplier = Supplier.new(supplier)
  new_supplier.area = Area.where(region: "Bourgogne-Franche-Comté").first
  new_supplier.save!
  @caterers << new_supplier
end

puts "Caterers created"
