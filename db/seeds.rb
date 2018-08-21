puts 'Destroying issues...'
Issue.destroy_all

puts 'Creating issues and one user...'

sanchinho = User.new(username: 'sanchinho', password: '123456', email: 'yannick.sanchez.guasch@gmail.com')
sanchinho.save

puts 'User created !'

trou = Issue.new(title: 'Trou dans la route', description: 'Ce trou est apparu récemment et il oblige à tous les cyclistes à contournement.', solution: 'Boucher le trou.', user_id: '5')
croisement = Issue.new(title: 'Croisement dangereux', description: 'Les voitures ne voient pas les cyclistes quand elles tournent, risque de se faire écraser.', solution: 'Modifier le carrefour.', user_id: '5')
piste = Issue.new(title: 'Piste cyclable interrompue', description: 'Cette piste est interrompue soudainement. Aucun panneau pour prévenir le cycliste, aucune alternative.', solution: 'Prolonger la piste ou avertir de la fin de piste cyclable.', user_id: '5')
eclairage = Issue.new(title: 'Eclairage défectueux', description: 'A partir de 20h on ne voit plus rien, je suis déjà tombé.', solution: 'Remettre la lumière.')
dangeureux = Issue.new(title: 'Piste cyclable dangereuse', description: 'Cette piste est trop étroite, elle me fait croiser des automobiles et à chaque fois je manque de tomber, trop étroit.', solution: 'Agrandir la chaussée ou mieux délimiter la piste.', user_id: '5')
sens_interdit = Issue.new(title: 'Piste cyclable en sens interdit', description: 'Chaque fois que je prends cette poste, je me fais klaxonner par les voitures qui ne comprennent pas pourquoi les cyclistes roulent en sens interdit.', solution: 'Améliorer le lignage de la piste.', user_id: '5')
travaux = Issue.new(title: 'Travaux sur la route', description: 'On ne peut plus emprunter ce chemin à cause des travaux et il n y a pas de signalement.', solution: 'Avertir les cyclistes avec un panneau.', user_id: '5')
viaduc = Issue.new(title: 'Viaduc effondré', description: 'Je ne peux plus circuler.', solution: 'Réparation urgente.')
acces = Issue.new(title: 'Pas d acces pour quitter la piste cyclable', description: 'Quand je prends cette piste cyclable, je ne peux pas la quitter sans traverser les grands boulevards, cest super dangereux.', solution: 'Construire une voix dacces de type pont pour les vélos.', user_id: '5')

trou.save
croisement.save
piste.save
eclairage.save
dangeureux.save
sens_interdit.save
travaux.save
viaduc.save
acces.save

puts 'Issues created !'
