# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Planning.destroy_all
Task.destroy_all
User.destroy_all
Coloc.destroy_all

puts "creating seeds"
colove = Coloc.new(name:"colove")
colove.save!

marion = User.new(email:"marion@lewagon.fr", pseudo:"mapiou", coloc: colove, password:"catstyle")
piero = User.new(email:"piero@lewagon.fr", pseudo:"piero", coloc: colove, password:"sicilian")
margot = User.new(email:"margot@lewagon.fr", pseudo:"margotte", coloc: colove, password:"ponystyle")
marion.save!
piero.save!
margot.save!

aspirateur = Task.new(name:"aspirateur", coloc: colove)
vaisselle = Task.new(name:"vaisselle", coloc: colove)
litière = Task.new(name:"litière", coloc: colove)
plantes = Task.new(name:"plantes", coloc: colove)
cuisine = Task.new(name:"cuisine", coloc: colove)
wc = Task.new(name:"wc", coloc: colove)
aspirateur.save!
vaisselle.save!
litière.save!
plantes.save!
cuisine.save!
wc.save!

planning1 = Planning.new(week_nb:49, completed: false, user: marion, task: vaisselle)
planning2 = Planning.new(week_nb:49, completed: false, user: marion, task: plantes)
planning3 = Planning.new(week_nb:49, completed: false, user: margot, task: aspirateur)
planning4 = Planning.new(week_nb:49, completed: false, user: margot, task: cuisine)
planning5 = Planning.new(week_nb:49, completed: false, user: piero, task: wc)
planning6 = Planning.new(week_nb:49, completed: false, user: piero, task: litière)
planning1.save!
planning2.save!
planning3.save!
planning4.save!
planning5.save!
planning6.save!
puts "ending seeds"
