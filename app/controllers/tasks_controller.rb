class TasksController < ApplicationController
  INITIAL_TASKS = [
    {
      name: "Salle de bain",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
    },
    {
      name: "Toilettes",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
    },
    {
      name: "Cuisine",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
    },
    {
      name: "Vaisselle",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
    },
    {
      name: "Frigo",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
    },
    {
      name: "Aspirateur",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
    },
    {
      name: "Serpillière",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
    },
    {
      name: "Poubelles",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
    },
    {
      name: "Poussière",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
    },
    {
      name: "Plantes",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
    },
    {
      name: "Litière",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
    },
    {
      name: "Canapé",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
    },
    {
      name: "Cheminée",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
    },
    {
      name: "Extérieur",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
    },
    {
      name: "Courses",
      icon: "Icône à définir",
      description: "Description à définir",
      weight: 20,
      points: 5
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
