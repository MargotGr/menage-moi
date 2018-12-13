class TasksController < ApplicationController
  # skip_before_action :authenticate_user!

  INITIAL_TASKS = [
    {
      name: "Salle de bain",
      description: "Cool ! Ça sent bon le propre ✔ 🛀",
      weight: 20,
      points: 15,
      icon: "douche.svg"
    },
    {
      name: "Toilettes",
      description: "Chouette ! On peut voir le fond de la cuvette ✔  🚾",
      weight: 20,
      points: 15,
      icon: "toilettes.svg"
    },
    {
      name: "Cuisine",
      description: "Monsieur Propre est passé dans la cuisine ✔",
      weight: 20,
      points: 5,
      icon: "cuisine.svg"
    },
    {
      name: "Vaisselle",
      description: "La vaisselle n'est plus dans l'évier, c'est nickel ✔",
      weight: 20,
      points: 18,
      icon: "vaisselle.svg"
    },
    {
      name: "Frigo",
      description: "Enfin le fromage périmé depuis des jours n'est plus dans le frigo ✔",
      weight: 20,
      points: 5,
      icon: "frigo.svg"
    },
    {
      name: "Aspirateur",
      description: "Cool, plus une miette par terre ✔",
      weight: 20,
      points: 10,
      icon: "aspirateur.svg"
    },
    {
      name: "Serpillière",
      description: "Ça brille! ✔",
      weight: 20,
      points: 15,
      icon: "serpilliere.svg"
    },
    {
      name: "Poubelles",
      description: "Adieu les mouches ! Les poubelles sont sorties ✔",
      weight: 20,
      points: 5,
      icon: "poubelles.svg"
    },
    {
      name: "Poussière",
      description: "Atchoum ! ça y est, fini la poussière ✔",
      weight: 20,
      points: 12,
      icon: "poussiere.svg"
    },
    {
      name: "Plantes",
      description: "Mère nature te remercie ✔",
      weight: 20,
      points: 10,
      icon: "plantes.svg"
    },
    {
      name: "Litière",
      description: "Miaou! Whiskas est content ✔",
      weight: 20,
      points: 10,
      icon: "litiere.svg"
    },
    {
      name: "Canapé",
      description: "Canapé en ordre ✔",
      weight: 20,
      points: 12,
      icon: "canape.svg"
    },
    {
      name: "Cheminée",
      description: "Père Nöel peut enfin repasser par la cheminée ✔",
      weight: 20,
      points: 10,
      icon: "cheminee.svg"
    },
    {
      name: "Extérieur",
      description: "C'est nickel dehors ✔",
      weight: 20,
      points: 10,
      icon: "exterieur.svg"
    },
    {
      name: "Courses",
      description: "Il était temps, on va bien manger ✔",
      weight: 20,
      points: 20,
      icon: "courses.svg"
    },
    {
      name: "Ajouter tâche",
      description: "Description à définir ",
      weight: 20,
      points: 20,
      icon: "logo3.svg"
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
    @selected_tasks_nb = @selected_tasks.count - 1
    @repart = []

    # Algorithme de répartition des tâches
    if (@selected_tasks_nb % @colocs.count == 0)
      @colocs.each do |coloc|
        (@selected_tasks_nb / @colocs.count).times do |i|
          @repart << coloc
        end
      end
    else
      @colocs.each do |coloc|
        (@selected_tasks_nb / @colocs.count).times do |i|
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
    @plannings = Planning.last(@selected_tasks_nb)
    @repart.shuffle!
    @plannings.each_with_index do |planning, index|
      planning.update(user: @repart[index])
    end

    redirect_to slotmachine_path
  end
end
