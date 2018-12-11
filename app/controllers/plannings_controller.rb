class PlanningsController < ApplicationController
  # skip_before_action :authenticate_user!

  def index
    @week_nb = Time.now.strftime("%U").to_i
    @plannings = Planning.where(user: current_user, week_nb: @week_nb).order(:id)
    @success = @plannings.all? { |planning| planning.completed == true }
    @points = 0
    @plannings.each do |planning|
      @points = @points + planning.task.points if planning.completed == true
    end
  end

  def update
    @planning = Planning.find(params[:id])
    @planning.update(completed: true)

    flash[:notice] = "Cool, tâche #{@planning.task.name.downcase} faite : + #{@planning.task.points} ⭐🌟"
    redirect_to plannings_path

    # Decommenter pour faire de l'AJAX
    # respond_to do |format|
    #   format.html { redirect_to plannings_path }
    #   format.js
    # end
  end

  def slot_machine
  end
end
