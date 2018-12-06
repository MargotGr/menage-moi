class TasksController < ApplicationController
  # skip_before_action :authenticate_user!

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
    # Création des données nécessaires pour afficher les tâches à sélectionner en checkboxes
    tasks = INITIAL_TASKS
    @default_tasks = tasks.map do |task|
      [task[:name], "#{task[:name]}_on"]
    end
  end

  def save_selection
    @week_nb = Time.now.strftime("%U").to_i
    @coloc = current_user.coloc
    @colocs = @coloc.users
    @selected_tasks = params["tasks"]["tasks"].map { |task| task.chomp("_on") }
    @repart = []

    # Algorithme de répartition des tâches
    if (@selected_tasks.count % @colocs.count == 0)
      @colocs.each do |coloc|
        (@selected_tasks.count / @colocs.count).times do |i|
          @repart << coloc
        end
      end
    else
      @colocs.each do |coloc|
        (@selected_tasks.count / @colocs.count).times do |i|
          @repart << coloc
        end
      end
      @repart << @colocs.last
    end

    Planning.where(week_nb: @week_nb).destroy_all

    INITIAL_TASKS.each do |task|
      if @selected_tasks.include?(task[:name])
        # Enregistrement des tâches sélectionnées par la nouvelle coloc dans la table Tasks
        @task = Task.new(task)
        @task.coloc = @coloc
        @task.save
        # Génération du premier planning de la coloc de la semaine en cours sans affectation
        @planning = Planning.new(week_nb: @week_nb, user: current_user, task: @task, completed: false)
        @planning.save
      end
    end
    # Affection des tâches de la première semaine
    @plannings = Planning.last(@selected_tasks.count)
    @repart.shuffle!
    @plannings.each_with_index do |planning, index|
      planning.update(user: @repart[index])
    end

    redirect_to plannings_path
  end
end
