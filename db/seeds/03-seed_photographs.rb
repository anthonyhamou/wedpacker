# CREATING PHOTOGRAPHS
puts "Creating Photographs"
array_photographs = [
  {
    service_name: "Neuville Photography",
    description: "Olivier Neuville travaille dans événementiel et le milieu artistique depuis plus de 15 ans. Il n'a pas de genre photographique de prédilection et apprécie de travailler sur tous les sujets, que ce soit sur les mariages, sur l'architecture ou bien avec des artistes. En somme, il place ses compétences au service de votre Jour J, pour réaliser des souvenirs de grande qualité.",
    price: 1300,
    avg_rating: 4.9,
    originality: "Photos originales, pleines d’émotions ou décalées en évitant les poses vues et revues.",
    service: @photograph,
  },
  {
    service_name: "Studio Guillaume Vallon",
    description: "S'il y a bien une occasion où vous devez être sous votre meilleur jour, c'est lors de votre mariage ! Le Studio Guillaume Vallon magnifie tous les grands moments de votre union pour qu'ils deviennent des souvenirs impérissables à partager avec tous ceux qui vous sont chers.
    Guillaume sera présent des préparatifs à la fin de votre cocktail et se pliera en quatre pour retranscrire les émotions de chaque instant sur ses images. De cette manière, il mettra en valeur votre jour et votre histoire qui débuteront...",
    price: 1900,
    avg_rating: 4.8,
    originality: "Passionné par la photographies depuis 15 ans, Guillaume allie créativité, perfectionnisme et rigueur pour sublimer votre plus beau jour.",
    service: @photograph,
  },
  {
    service_name: "Paul Ly Photographie",
    description: "Agé de 28 ans, ce jeune photographe passionné immortalise pour vous les grandes occasions de votre vie. Naturel, tel est l’adjectif qui pourrait qualifier ses clichés. Il s’intéresse aux émotions, à la spontanéité pour photographier avec justesse votre journée.",
    price: 1100,
    avg_rating: 4.9,
    originality: "Paul Ly travaille avec la lumière naturelle et retouche ses clichés avec parcimonie pour préserver votre personnalité.",
    service: @photograph,
  }
]

@photographs = []
array_photographs.each do |supplier|
  new_supplier = Supplier.new(supplier)
  new_supplier.area = Area.where(region: "Bourgogne-Franche-Comté").first
  new_supplier.save!
  @photographs << new_supplier
end

puts "Photographs created"
