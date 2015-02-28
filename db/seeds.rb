# Methods
 def set_clean_state!
  Specialty.delete_all
  Client.delete_all
  Professional.delete_all
end

def create_specialty!(name)
  Specialty.create! name: name
end

def create_client!(name, surnames)
  Client.create! name: name, surnames: surnames
end

def create_professional!(name, surnames, distance, average_response_time, hourly_price, specialty_name, &block)
  specialty = Specialty.find_by_name(specialty_name.capitalize)
  professional = Professional.create! name: name, surnames: surnames,
    distance: distance, average_response_time: average_response_time, hourly_price: hourly_price
  professional.specialties << specialty

  block.call(professional)
end

def create_impression!(professional, client_id, rating, comment)
  # different created at
  client = Client.find_by_name(client_id.to_s.capitalize)
  Impression.create! professional: professional, client: client, rating: rating, comment: comment
end

# Let's start
set_clean_state!

# Specialties
%w{ plumber painter decorator cleaning nanny }.each do |specialty_name|
  create_specialty!(specialty_name.capitalize)
end

# Clients
create_client!('Albert', 'Bellonch')
create_client!('Marisa', 'Paredes')
create_client!('John', 'Smith')
create_client!('Felipe', 'Caicedo')
create_client!('Sergio', 'González')
create_client!('Albertus', 'Jensen')
create_client!('Salva', 'Sevilla')
create_client!('Abraham', 'López')
create_client!('Jason', 'Kidd')
create_client!('Benjamin', 'Button')
create_client!('Hans', 'de Vrijn')
create_client!('Cesc', 'Freixes')
create_client!('Susana', 'Del Hoyo')
create_client!('Johnny', 'Fontaine')
create_client!('Aritz', 'Arbilla')
create_client!('Salva', 'Sevilla')
create_client!('Cristian', 'Stuani')
create_client!('Ruben', 'Duarte')
create_client!('Emili', 'Alzamora')
create_client!('Asier', 'del Horno')
create_client!('Julia', 'Perelló')
create_client!('Abraham', 'López')
create_client!('Jane', 'Fonda')
create_client!('Hilary', 'Swan')
create_client!('Yosif', 'Styling')
create_client!('Pamela', 'Choo')
create_client!('Rudiger', 'Desbains')
create_client!('Jayson', 'Johnson')
create_client!('Rodrigo', 'Rato')
create_client!('Giorgio', 'Moroder')
create_client!('Patrick', 'Bateman')
create_client!('Prez', 'Balusky')
create_client!('Jan', 'Pylsenich')
create_client!('Victor', 'Muñoz')

# Professionals: plumbers
create_professional!('Juan', 'Pérez', 1200, 53, 20, :plumber) do |p|
  create_impression!(p, :marisa, 5, "Punctual and correct. I am very happy.")
  create_impression!(p, :john, 5, "I hope not to see Juan again, but in case I need him again, I'll get in touch again for sure.")
  create_impression!(p, :hans, 4, "Everything was perfect. He came, he saw, he fixed it.")
  create_impression!(p, :john, 5, "Very serious, and punctual. It's great to see such a professional.")
end
create_professional!('Marisa', 'Marín', 2000, 37, 25, :plumber) do |p|
  create_impression!(p, :cesc, 3, "He came 20 minutes late, and I couldn't pick up my kids at school, but he made a discount in exchange.")
  create_impression!(p, :susana, 4, "Everything was fine.")
  create_impression!(p, :albertus, 5, "Is not the most kindly person, but it was ok.")
  create_impression!(p, :jason, 4, "Punctual and corrent. I'm very happy.")
end
create_professional!('Bernat', 'Farrero', 500, 41, 70, :plumber) do |p|
  create_impression!(p, :marisa, 5, "Punctual and correct. I am very happy.")
  create_impression!(p, :john, 5, "I hope not to see Juan again, but in case I need him again, I'll get in touch again for sure.")
  create_impression!(p, :hans, 4, "Everything was perfect. He came, he saw, he fixed it.")
  create_impression!(p, :john, 5, "Very serious, and punctual. It's great to see such a professional.")
end
create_professional!('Roger', 'Dobaño', 1300, 40, 25, :plumber) do |p|
  create_impression!(p, :cesc, 3, "He came 20 minutes late, and I couldn't pick up my kids at school, but he made a discount in exchange.")
  create_impression!(p, :susana, 4, "Everything was fine.")
  create_impression!(p, :albertus, 5, "Is not the most kindly person, but it was ok.")
  create_impression!(p, :jason, 4, "Punctual and corrent. I'm very happy.")
end
create_professional!('Celia', 'Gratacós', 2000, 60, 15, :plumber) do |p|
  create_impression!(p, :marisa, 2, "Punctual and correct. I am very happy.")
  create_impression!(p, :ruben, 5, "I hope not to see Juan again, but in case I need him again, I'll get in touch again for sure.")
  create_impression!(p, :hans, 4, "Everything was perfect. He came, he saw, he fixed it.")
  create_impression!(p, :john, 3, "Very serious, and punctual. It's great to see such a professional.")
end

# Professionals: painters
create_professional!('Cristina', 'Hans', 1000, 49, 40, :painter) do |p|
  create_impression!(p, :johnny, 5, "The best painter I've ever seen in my life. Tidy, punctual, clean and the result was amazing.")
  create_impression!(p, :aritz, 2, "An artist: fast, tidy, punctual and he accomplish all the deadlines. And he is very funny.")
  create_impression!(p, :salva, 3, "An Excellent painter. I trully recommend him.")
  create_impression!(p, :felipe, 4, "Enver offered us an awesome service. The best I've ever seen.")
end

create_professional!('Klodian', 'Duro', 2800, 30, 10, :painter) do |p|
  create_impression!(p, :cristian, 5, "We asked him to paint our house blue but he painted green, but the result was nice. He's an artist.")
  create_impression!(p, :victor, 3, "We wanted everything white and he painted purple. A little but dark for us, but he convinced us that it was better in that way, so is ok for us. He is very tidy and fast.")
  create_impression!(p, :asier, 5, "He painted us the Gernika in the kid's room. It's a little bit creepy but it's cool. What an artist.")
  create_impression!(p, :julia, 4, "We were waiting something amazing but no, he paint the house like we wanted. Boring but OK.")
end

create_professional!('Abraham López', 'Hans', 1000, 49, 40, :painter) do |p|
  create_impression!(p, :ruben, 5, "We asked him to paint our house blue but he painted green, but the result was nice. He's an artist.")
  create_impression!(p, :emili, 2, "We wanted everything white and he painted purple. A little but dark for us, but he convinced us that it was better in that way, so is ok for us. He is very tidy and fast.")
  create_impression!(p, :asier, 3, "Amazing. He painted us the Gernika in the kid's room. It's a little bit creepy but it's cool. What an artist.")
  create_impression!(p, :julia, 4, "We were waiting something amazing but no, he paint the house like we wanted. Boring but ok.")
end

create_professional!('Rebeca', 'Garcia', 1400, 40, 30, :painter) do |p|
  create_impression!(p, :cristian, 5, "Good painter. Tidy and formal.")
  create_impression!(p, :victor, 3, "Pretty well. I recommend him.")
  create_impression!(p, :abraham, 4, "Good.")
end

create_professional!('Joana', 'Mikhtaryan', 700, 42, 50, :painter) do |p|
  create_impression!(p, :cristian, 5, "Good painter. Tidy and formal.")
  create_impression!(p, :victor, 3, "Pretty well. I recommend him.")
  create_impression!(p, :abraham, 4, "Good.")
end

# Professionals: decorators
create_professional!('Claudia', 'Puig', 800, 100, 20, :decorator) do |p|
  create_impression!(p, :jane, 5, "Nice. Great. An artist.")
  create_impression!(p, :hilary, 4, "Cool. Awesome. She created something amazing.")
end

create_professional!('Jan', 'Palach', 400, 130, 12, :decorator) do |p|
  create_impression!(p, :hilary, 4, "Cool. Awesome. He create something amazing.")
  create_impression!(p, :pamela, 5, "Nice, amazing, love it, awesome.")
end

create_professional!('Pavel', 'Dubcek', 1200, 40, 20, :decorator) do |p|
  create_impression!(p, :yosif, 5, "Soviet Style artist. Very cool.")
  create_impression!(p, :hilary, 4, "Cool. Awesome. He created something amazing.")
end

create_professional!('Alicia', 'Lopez', 600, 50, 80, :decorator) do |p|
  create_impression!(p, :jason, 5, "What an artist. Great result.")
  create_impression!(p, :jason, 5, "I mean, like, really, this was amazing.")
end

create_professional!('Hayk', 'Ananyan', 50, 200, 120, :decorator) do |p|
  create_impression!(p, :rudiger, 5, "He imposed what he wanted, but the result was impressive.")
  create_impression!(p, :hilary, 4, "Nice, great. He is a very talented decorator.")
end

create_professional!('Matteo', 'Di Napoli', 450, 100, 15, :decorator) do |p|
  create_impression!(p, :jayson, 1, "What a disaster!! Don't contact him! What he did was something horrible.")
  create_impression!(p, :rodrigo, 1, "He is a fraud.")
end

# Professionals: cleaning
create_professional!('Samuel', 'Grant', 2000, 5, 10, :cleaning) do |p|
  create_impression!(p, :jayson, 4, "Tidy and honest.")
  create_impression!(p, :giorgio, 5, "Honest, cool.")
end

create_professional!('Clara', 'Romaní', 1200, 12, 25, :cleaning) do |p|
  create_impression!(p, :yosif, 2, "Too expensive, but good service.")
  create_impression!(p, :pamela, 4, "Honestly? I don't know.")
end

create_professional!('Mar', 'Dominguez', 300, 2, 9, :cleaning) do |p|
  create_impression!(p, :victor, 5, "She's the best.")
  create_impression!(p, :abraham, 4, "Tidy, punctual, effective.")
end

create_professional!('Achille', 'Sberna', 3000, 30, 4, :cleaning) do |p|
  create_impression!(p, :rudiger, 3, "Honest, cool, with a vision on architecture.")
  create_impression!(p, :jason, 4, "Great, I recommend her.")
end

create_professional!('Javier', 'Aguirre', 1200, 20, 15, :cleaning) do |p|
  create_impression!(p, :pamela, 3, "Tidy, punctual, a bit smelly.")
  create_impression!(p, :yosif, 3, "Too late, but good work. Mixed Feelings.")
end

create_professional!('Ander', 'Maguregui', 2100, 50, 18, :cleaning) do |p|
  create_impression!(p, :hilary, 3, "A little bit rude, but ok.")
  create_impression!(p, :patrick, 5, "he saved my life.")
end

# Professionals: cleaning
create_professional!('Núria', 'López', 2000, 25, 17, :nanny) do |p|
  create_impression!(p, :prez, 4, "Charming, tidy, honest, she's cool.")
  create_impression!(p, :jason, 3, "Tidy and honest.")
end

create_professional!('Maria', 'Álvarez', 1200, 90, 16, :nanny) do |p|
  create_impression!(p, :hans, 4, "Honest, cool, even sexy.")
  create_impression!(p, :pamela, 1, "Stole my husband.")
end

create_professional!('Petra', 'Marshall', 4500, 40, 12, :nanny) do |p|
  create_impression!(p, :prez, 4, "Tidy, punctual, effective.")
  create_impression!(p, :hilary, 1, "She's the best.")
end

create_professional!('Iris', 'Villaescusa', 1200, 20, 19, :nanny) do |p|
  create_impression!(p, :john, 4, "A little bit rude, but ok.")
  create_impression!(p, :jan, 1, "Wooow, he's amazing!! I recommend him.")
end

# More specialties
specialties = Specialty.all
Professional.all.each do |professional|
  (specialties - professional.specialties).shuffle.take(1 + rand(2)).each do |specialty|
    professional.specialties << specialty
  end
end
