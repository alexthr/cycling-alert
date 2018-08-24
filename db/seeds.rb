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

trou = Issue.new(title: 'Trou dans la route', description: 'Ce trou est apparu récemment et il oblige à tous les cyclistes à contournement.', solution: 'Boucher le trou.', address: "107, cours Balguerie Stuttenberg, Bordeaux")
croisement = Issue.new(title: 'Croisement dangereux', description: 'Les voitures ne voient pas les cyclistes quand elles tournent, risque de se faire écraser.', solution: 'Modifier le carrefour.', address: "148, cours Balguerie Stuttenberg, Bordeaux")
piste = Issue.new(title: 'Piste cyclable interrompue', description: 'Cette piste est interrompue soudainement. Aucun panneau pour prévenir le cycliste, aucune alternative.', solution: 'Prolonger la piste ou avertir de la fin de piste cyclable.', address: "36, rue René Vaché, Talence")
eclairage = Issue.new(title: 'Eclairage défectueux', description: 'A partir de 20h on ne voit plus rien, je suis déjà tombé.', solution: 'Remettre la lumière.', address: "50, rue Servandoni, Bordeaux")
dangereux = Issue.new(title: 'Piste cyclable dangereuse', description: 'Cette piste est trop étroite, elle me fait croiser des automobiles et à chaque fois je manque de tomber, trop étroit.', solution: 'Agrandir la chaussée ou mieux délimiter la piste.', address: "6, rue de Condé, Bordeaux")
sens_interdit = Issue.new(title: 'Piste cyclable en sens interdit', description: 'Chaque fois que je prends cette poste, je me fais klaxonner par les voitures qui ne comprennent pas pourquoi les cyclistes roulent en sens interdit.', solution: 'Améliorer le lignage de la piste.', address: "9, rue Rolland, Bordeaux")
travaux = Issue.new(title: 'Travaux sur la route', description: 'On ne peut plus emprunter ce chemin à cause des travaux et il n y a pas de signalement.', solution: 'Avertir les cyclistes avec un panneau.', address: "10, rue villa Gaudelet, Paris")
viaduc = Issue.new(title: 'Viaduc effondré', description: 'Je ne peux plus circuler.', solution: 'Réparation urgente.', address: "10, rue du 14 juillet, le Pré-Saint-Gervais")
acces = Issue.new(title: 'Pas d acces pour quitter la piste cyclable', description: 'Quand je prends cette piste cyclable, je ne peux pas la quitter sans traverser les grands boulevards, cest super dangereux.', solution: 'Construire une voix dacces de type pont pour les vélos.', address: "14, rue de l'Odéon, Paris")


trou.user = sanchinho
croisement.user = sanchinho
eclairage.user = carine
dangereux.user = carine
sens_interdit.user = visant
travaux.user = alexthr
viaduc.user = alexthr
acces.user = visant


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
