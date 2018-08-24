puts 'Destroying issues and users'
Issue.destroy_all
User.destroy_all

puts 'Creating issues and one user...'

sanchinho = User.new(username: 'sanchinho', password: '123456', email: 'yannick.sanchez.guasch@gmail.com')
sanchinho.save
carine = User.create(username: "carineLC", email: "carine.le.charles@gmail.com", password: "123456")
alexthr = User.create(username: "alexthr", email: "alex.thoreux@gmail.com", password: "123456")
visant = User.create(username: "visant", email: "visant@gmail.com", password: "123456")

puts 'Users created !'

trou = Issue.new(title: "Bite gênante", description: 'Cette bite est en plein milieu de la piste cyclable.', solution: 'Couper la bite.', address: "50, cours Victor Hugo, Bordeaux")
croisement = Issue.new(title: 'Végétation luxuriante', description: 'Un giga buisson bloque la circulation des cyclistes.', solution: 'Raser le buisson.', address: "148, cours Balguerie Stuttenberg, Bordeaux")
piste = Issue.new(title: 'Patrick Buisson', description: 'Un giga buisson bloque la circulation des cyclistes.', solution: 'Raser le buisson.', address: "36, rue René Vaché, Talence")
eclairage = Issue.new(title: "Travaux sur la route", description: "On ne peut plus emprunter ce chemin à cause des travaux et il n y a pas de signalement.", solution: 'Remettre la lumière.', address: "50, rue Servandoni, Bordeaux")
dangereux = Issue.new(title: 'Stationnement gênant', description: 'Cette piste est encombrée par les voitures qui sont mal garées et jamais verbalisées.', solution: 'Mettre des PV.', address: "6, rue de Condé, Bordeaux")
sens_interdit = Issue.new(title: "Poteau gênant", description: "Un poteau a poussé au beau milieu de la piste, c'est embêtant", solution: 'Déplacer la piste ou le poteau.', address: "9, rue Rolland, Bordeaux")
travaux = Issue.new(title: 'Grillage sur la piste', description: 'On ne peut plus emprunter ce chemin à cause du grillage et il n y a pas de signalement.', solution: 'Avertir les cyclistes avec un panneau.', address: "10, rue villa Gaudelet, Paris")
viaduc = Issue.new(title: 'Champ de bosses', description: 'Je ne peux plus circuler.', solution: 'Aplanir la route.', address: "10, rue du 14 juillet, le Pré-Saint-Gervais")
acces = Issue.new(title: 'Bite gênante', description: 'Encore une bite à éviter !.', solution: "Arrêter l'alcool.", address: "14, rue de l'Odéon, Paris")


trou.user = sanchinho
croisement.user = sanchinho
eclairage.user = carine
dangereux.user = carine
sens_interdit.user = visant
travaux.user = alexthr
viaduc.user = alexthr
acces.user = visant

trou.photo_urls = ["https://res.cloudinary.com/alexthr/image/upload/v1535107482/seed4.jpg"]
croisement.photo_urls = ["https://res.cloudinary.com/alexthr/image/upload/v1535113548/seed2.jpg"]
piste.photo_urls = ["https://res.cloudinary.com/alexthr/image/upload/v1535122297/seed9.jpg"]
eclairage.photo_urls = ["https://res.cloudinary.com/alexthr/image/upload/v1535114280/seed1.jpg"]
dangereux.photo_urls = ["https://res.cloudinary.com/alexthr/image/upload/v1535113542/seed3.jpg"]
sens_interdit.photo_urls = ["https://res.cloudinary.com/alexthr/image/upload/v1535039431/seed5.jpg"]
travaux.photo_urls = ["https://res.cloudinary.com/alexthr/image/upload/v1535039422/seed6.jpg"]
viaduc.photo_urls = ["https://res.cloudinary.com/alexthr/image/upload/v1535039409/seed7.jpg"]
acces.photo_urls = ["https://www.terraeco.net/IMG/jpg/Reims-01.jpg"]

puts 'Photos uploaded'

trou.save
croisement.save
piste.save
eclairage.save
dangereux.save
sens_interdit.save
travaux.save
viaduc.save
acces.save

puts 'Issues created !'
