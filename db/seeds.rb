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

colove = Coloc.new(name:"colove")
colove.save!

marion = User.new(email:"marion@lewagon.fr", pseudo:"mapiou", coloc: colove, password:"catstyle")
piero = User.new(email:"piero@lewagon.fr", pseudo:"piero", coloc: colove, password:"sicilian")
margot = User.new(email:"margot@lewagon.fr", pseudo:"margotte", coloc: colove, password:"ponystyle")
marion.save!
piero.save!
margot.save!

initial_tasks = [
  {
    name: "Salle de bain",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "douche.svg",
    coloc: colove
  },
  {
    name: "Toilettes",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "toilettes.svg",
    coloc: colove
  },
  {
    name: "Cuisine",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "cuisine.svg",
    coloc: colove
  },
  {
    name: "Vaisselle",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "vaisselle.svg",
    coloc: colove
  },
  {
    name: "Frigo",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "frigo.svg",
    coloc: colove
  },
  {
    name: "Aspirateur",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "aspirateur.svg",
    coloc: colove
  },
  {
    name: "Serpillière",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "serpilliere.svg",
    coloc: colove
  },
  {
    name: "Poubelles",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "poubelles.svg",
    coloc: colove
  },
  {
    name: "Poussière",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "poussiere.svg",
    coloc: colove
  },
  {
    name: "Plantes",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "plantes.svg",
    coloc: colove
  },
  {
    name: "Litière",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "litiere.svg",
    coloc: colove
  },
  {
    name: "Canapé",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "canape.svg",
    coloc: colove
  },
  {
    name: "Cheminée",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "cheminee.svg",
    coloc: colove
  },
  {
    name: "Extérieur",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "exterieur.svg",
    coloc: colove
  },
  {
    name: "Courses",
    description: "Description à définir",
    weight: 20,
    points: 5,
    icon: "courses.svg",
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
