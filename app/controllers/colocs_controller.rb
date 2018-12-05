class ColocsController < ApplicationController
  def new
    @coloc = Coloc.new
  end

  def create
    @coloc = Coloc.new(coloc_params)
    @coloc.save
    if @coloc.save
      redirect_to plannings_path
    else
      render :new
    end
  end

  private

  def coloc_params
    params.require(:coloc).permit(:name)
  end
end
