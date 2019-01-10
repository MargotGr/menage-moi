class ColocsController < ApplicationController
  # skip_before_action :authenticate_user!

  def new
    @coloc = Coloc.new
  end

  def create
    @coloc = Coloc.new(coloc_params)
    @coloc.save
    if @coloc.save
      flash[:notice] = "Super, ta coloc a bien été créée !"
      redirect_to tasks_select_path
    else
      render :new
    end
  end

  def show
    if current_user.coloc_id == 108
      redirect_to colocs_new_path
    else
      @week_nb = Time.now.strftime("%U").to_i
      @coloc = current_user.coloc
      @colocs = @coloc.users
      @ranking = []

      @colocs.each do |coloc|
        @points = 0
        coloc.plannings.where(week_nb:@week_nb).each do |planning|
          @points = @points + planning.task.points if planning.completed == true
        end
        if coloc.plannings.where(week_nb:@week_nb).all? { |planning| planning.completed == true }
          @ranking << [coloc, @points]
        else
          @points = @points - 15
          @ranking << [coloc, @points]
        end
      end

      @ranking.sort! do |a, b|
        b[1] <=> a[1]
      end
    end
  end

  private

  def coloc_params
    params.require(:coloc).permit(:name)
  end
end
