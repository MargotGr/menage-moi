class TasksController < ApplicationController
  # skip_before_action :authenticate_user!

  INITIAL_TASKS = [
    {
      name: "Salle de bain",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "douche.svg"
    },
    {
      name: "Toilettes",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "toilettes.svg"
    },
    {
      name: "Cuisine",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "cuisine.svg"
    },
    {
      name: "Vaisselle",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "vaisselle.svg"
    },
    {
      name: "Frigo",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "frigo.svg"
    },
    {
      name: "Aspirateur",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "aspirateur.svg"
    },
    {
      name: "Serpillière",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "serpilliere.svg"
    },
    {
      name: "Poubelles",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "poubelles.svg"
    },
    {
      name: "Poussière",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "poussiere.svg"
    },
    {
      name: "Plantes",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "plantes.svg"
    },
    {
      name: "Litière",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "litiere.svg"
    },
    {
      name: "Canapé",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "canape.svg"
    },
    {
      name: "Cheminée",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "cheminee.svg"
    },
    {
      name: "Extérieur",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "exterieur.svg"
    },
    {
      name: "Courses",
      description: "Description à définir",
      weight: 20,
      points: 5,
      icon: "courses.svg"
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
    @selected_tasks = params["tasks"]["tasks"].map { |task| task.split("=")[2].split("_")[0][1..-1] if task.present? }
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
