class PlanningsController < ApplicationController
  # skip_before_action :authenticate_user!

  def index
    @week_nb = Time.now.strftime("%U").to_i
    @plannings = Planning.where(user: current_user, week_nb: @week_nb).order(:id)
  end

  def update
    @planning = Planning.find(params[:id])
    @planning.update(completed: true)
    flash[:alert] = "Cool, tu as réalisé la tâche #{@planning.task.name.downcase} : + #{@planning.task.points} points !"
    redirect_to plannings_path
  end
end
