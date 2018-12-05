class PlanningsController < ApplicationController
  def index
    @plannings = Planning.where(user:current_user)
  end

  def update
  end
end
