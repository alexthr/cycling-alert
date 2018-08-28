puts 'Destroying issues and users'
Issue.destroy_all
User.destroy_all
Comment.destroy_all

puts 'Creating issues and users...'

sanchinho = User.new(username: 'sanchinho', password: '123456', email: 'yannick.sanchez.guasch@gmail.com')
sanchinho.avatar_url = "https://avatars1.githubusercontent.com/u/7702269?v=4"
sanchinho.save
carine = User.new(username: "carineLC", email: "carine.le.charles@gmail.com", password: "123456")
carine.avatar_url = "https://avatars0.githubusercontent.com/u/39913570?v=4"
carine.save
alexthr = User.new(username: "alexthr", email: "alex.thoreux@gmail.com", password: "123456")
alexthr.avatar_url = "https://avatars0.githubusercontent.com/u/40071634?v=4"
alexthr.save
visant = User.new(username: "visant", email: "visant@gmail.com", password: "123456")
visant.avatar_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/nw5ey8f0ze2hxaecqvt1.jpg"
visant.save
juppe = User.new(username: "Mairie de Bordeaux", email: "juppe@gmail.com", password: "123456", city: "Bordeaux", admin: true)
juppe.avatar_url = "http://www.bordeaux.fr/images/ebx/fr/organisme/984/format7/logo_mairie_bordeaux_1.png"
juppe.save

puts 'Users created!'

trou = Issue.new(title: "Bite gênante", description: 'Cette bite est en plein milieu de la piste cyclable.', solution: 'Couper la bite.', address: "50, cours Victor Hugo, Bordeaux", city: "Bordeaux")
croisement = Issue.new(title: 'Végétation luxuriante', description: 'Un giga buisson bloque la circulation des cyclistes.', solution: 'Raser le buisson.', address: "148, cours Balguerie Stuttenberg, Bordeaux", city: "Bordeaux")
piste = Issue.new(title: 'Patrick Buisson', description: 'Un giga buisson bloque la circulation des cyclistes.', solution: 'Raser le buisson.', address: "36, rue René Vaché, Talence", city: "Talence")
eclairage = Issue.new(title: "Travaux sur la route", description: "On ne peut plus emprunter ce chemin à cause des travaux et il n y a pas de signalement.", solution: 'Remettre la lumière.', address: "50, rue Servandoni, Bordeaux", city: "Bordeaux")
dangereux = Issue.new(title: 'Stationnement gênant', description: 'Cette piste est encombrée par les voitures qui sont mal garées et jamais verbalisées.', solution: 'Mettre des PV.', address: "6, rue de Condé, Bordeaux", city: "Bordeaux")
sens_interdit = Issue.new(title: "Poteau gênant", description: "Un poteau a poussé au beau milieu de la piste, c'est embêtant", solution: 'Déplacer la piste ou le poteau.', address: "9, rue Rolland, Bordeaux", city: "Bordeaux")
travaux = Issue.new(title: 'Grillage sur la piste', description: 'On ne peut plus emprunter ce chemin à cause du grillage et il n y a pas de signalement.', solution: 'Avertir les cyclistes avec un panneau.', address: "10, rue villa Gaudelet, Paris", city: "Paris")
viaduc = Issue.new(title: 'Champ de bosses', description: 'Je ne peux plus circuler.', solution: 'Aplanir la route.', address: "10, rue du 14 juillet, le Pré-Saint-Gervais", city: "Le Pré-Saint-Gervais")
acces = Issue.new(title: 'Bite gênante', description: 'Encore une bite à éviter !', solution: "Arrêter l'alcool.", address: "14, rue de l'Odéon, Paris", city: "Paris")

trou.user = sanchinho
croisement.user = carine
piste.user = sanchinho
eclairage.user = alexthr
dangereux.user = carine
sens_interdit.user = visant
travaux.user = alexthr
viaduc.user = alexthr
acces.user = visant

puts 'User assigned'

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

trou.vote_count = 5
croisement.vote_count = 2
piste.vote_count = 10
dangereux.vote_count = 2
sens_interdit.vote_count = 1
viaduc.vote_count = 3
acces.vote_count = 6

puts 'Issues created!'

comment1 = Comment.create(content: "Je valide ce problème ! J'y passe tous les matins.", user_id: alexthr.id)
comment2 = Comment.create(content: "Je n'en peux plus de ces bites !", user_id: carine.id)
trou.comments = [comment1, comment2]

comment3 = Comment.create(content: "Un coup de tronçonneuse et ça repart.", user_id: sanchinho.id)
comment4 = Comment.create(content: "J'avais oublié ce buisson l'autre jour et je suis tombé dedans à pleine vitesse.", user_id: sanchinho.id)
comment5 = Comment.create(content: "Je valide ! On ne voit même plus la piste cyclable.", user_id: alexthr.id)
comment6 = Comment.create(content: "Coupez-lui la touffe!", user_id: visant.id)
croisement.comments =  [comment3, comment4, comment5, comment6]

piste.comments = [comment6]

comment7 = Comment.create(content: "Ces travaux durent depuis plusieurs mois...", user_id: carine.id)
comment8 = Comment.create(content: "Juppé à la rescousse!", user_id: sanchinho.id)
comment9 = Comment.create(content: "Il y a une piste cyclable qui contourne les travaux si vous prenez la rue à droite.", user_id: visant.id)
eclairage.comments = [comment7, comment8, comment9]

comment10 = Comment.create(content: "Je valide !", user_id: sanchinho.id)
dangereux.comments = [comment10]

comment11 = Comment.create(content: "Ce poteau est dangereux car il est en bas d'une descente.", user_id: alexthr.id)
comment12 = Comment.create(content: "Exact ! Un soir en pleine nuit, je ne l'avais pas vu et je l'ai pris en pleine face.", user_id: carine.id)
comment13 = Comment.create(content: "J'ai fait la même..'", user_id: visant.id)
comment14 = Comment.create(content: "Que fait la mairie ?", user_id: sanchinho.id)
sens_interdit.comments = [comment11, comment12, comment13, comment14]

comment15 = Comment.create(content: "Mieux que les montagnes russes !", user_id: sanchinho.id)
comment16 = Comment.create(content: "Il ne faut pas avoir le mal de mer !", user_id: carine.id)
viaduc.comments = [comment15, comment16]

puts 'Comments created!'
