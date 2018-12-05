class PlanningsController < ApplicationController
  def index
    @plannings = Planning.where(user:current_user)
  end

  def generate
    redirect_to plannings_path
  end

  def update
  end
end
