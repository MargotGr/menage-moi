class ColocsController < ApplicationController
  # skip_before_action :authenticate_user!

  def new
    @coloc = Coloc.new
  end

  def create
    @coloc = Coloc.new(coloc_params)
    @coloc.save
    if @coloc.save
      flash[:alert] = "Super, tes colocs t'ont rejoint sur Ménage-moi ! Votre coloc a bien été créée !"
      redirect_to tasks_select_path
    else
      render :new
    end
  end

  private

  def coloc_params
    params.require(:coloc).permit(:name)
  end
end
