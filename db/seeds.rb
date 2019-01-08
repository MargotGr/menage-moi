# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning DB"

Planning.destroy_all
Task.destroy_all
User.destroy_all
Coloc.destroy_all

puts "Creating seeds"

colove = Coloc.new(name:"joyeux bordel", id:108)
colove.save!

marion = User.new(email:"marion.nou@gmail.com", pseudo:"marion", coloc: colove, password:"azerty", photo:"marion.jpg")
piero = User.new(email:"piero.binet@gmail.com", pseudo:"piero", coloc: colove, password:"sicilian", photo:"piero.jpg")
margot = User.new(email:"margot.gole@hotmail.fr", pseudo:"margot", coloc: colove, password:"ponystyle", photo:"margot.jpg")
marion.save!
piero.save!
margot.save!

initial_tasks = [
  {
    name: "Salle de bain",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "douche.svg",
    coloc: colove
  },
  {
    name: "Toilettes",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "toilettes.svg",
    coloc: colove
  },
  {
    name: "Cuisine",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "cuisine.svg",
    coloc: colove
  },
  {
    name: "Vaisselle",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "vaisselle.svg",
    coloc: colove
  },
  {
    name: "Frigo",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "frigo.svg",
    coloc: colove
  },
  {
    name: "Aspirateur",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "aspirateur.svg",
    coloc: colove
  },
  {
    name: "Serpillière",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "serpilliere.svg",
    coloc: colove
  },
  {
    name: "Poubelles",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "poubelles.svg",
    coloc: colove
  },
  {
    name: "Poussière",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "poussiere.svg",
    coloc: colove
  },
  {
    name: "Plantes",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "plantes.svg",
    coloc: colove
  },
  {
    name: "Litière",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "litiere.svg",
    coloc: colove
  },
  {
    name: "Canapé",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "canape.svg",
    coloc: colove
  },
  {
    name: "Cheminée",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "cheminee.svg",
    coloc: colove
  },
  {
    name: "Extérieur",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "exterieur.svg",
    coloc: colove
  },
  {
    name: "Courses",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "courses.svg",
    coloc: colove
  },
  {
    name: "Ajouter tâche",
    description: "Description à définir",
    weight: 0,
    points: 0,
    icon: "logo3.svg",
    coloc: colove
    }
]

initial_tasks.each do |task|
  Task.create(task)
end

planning1 = Planning.new(week_nb:1, completed: false, user: marion, task: Task.find_by(name: "Salle de bain"))
planning2 = Planning.new(week_nb:1, completed: false, user: marion, task: Task.find_by(name: "Plantes"))
planning3 = Planning.new(week_nb:1, completed: false, user: margot, task: Task.find_by(name: "Aspirateur"))
planning4 = Planning.new(week_nb:1, completed: false, user: margot, task: Task.find_by(name: "Cuisine"))
planning5 = Planning.new(week_nb:1, completed: false, user: piero, task: Task.find_by(name: "Toilettes"))
planning6 = Planning.new(week_nb:1, completed: false, user: piero, task: Task.find_by(name: "Litière"))
planning1.save!
planning2.save!
planning3.save!
planning4.save!
planning5.save!
planning6.save!

puts "Seeds created"
