class TasksController < ApplicationController
  INITIAL_TASKS = [
    {
      name: "Salle de bain",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "douche.png"
    },
    {
      name: "Toilettes",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "toilettes.png"
    },
    {
      name: "Cuisine",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "cuisine.png"
    },
    {
      name: "Vaisselle",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "vaisselle.png"
    },
    {
      name: "Frigo",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "frigo.png"
    },
    {
      name: "Aspirateur",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "aspirateur.png",
    },
    {
      name: "Serpillière",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "serpillere.png"
    },
    {
      name: "Poubelles",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "poubelles.png"
    },
    {
      name: "Poussière",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "poussiere.png"
    },
    {
      name: "Plantes",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "plante.png"
    },
    {
      name: "Litière",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "litiere.png"
    },
    {
      name: "Canapé",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "canape.png"
    },
    {
      name: "Cheminée",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "cheminee.png"
    },
    {
      name: "Extérieur",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "exterieur.png"
    },
    {
      name: "Courses",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "courses.png"
    }
  ]

  def select_tasks
    tasks = INITIAL_TASKS
    @default_tasks = tasks.map do |task|
      [task[:name], "#{task[:name]}_on"]
    end
  end

  def save_selection
    @selected_tasks = params["tasks"]["tasks"].map { |task| task.chomp("_on") }
    INITIAL_TASKS.each do |task|
      if @selected_tasks.include?(task[:name])
        @task = Task.new(task)
        @task.coloc = current_user.coloc
        @task.save
      end
    end
    redirect_to plannings_path
  end
end
