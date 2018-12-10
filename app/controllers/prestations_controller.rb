class PrestationsController < ApplicationController
  before_action :set_prestation, only: [:show, :edit]
  def index
    @prestations = Prestation.all
  end

  def new
    @prestation = Prestation.new
    @user = current_user
  end

  def create
    @prestation = Prestation.new(prestation_params)
    if @prestation.save
      redirect_to "/prestations"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @prestation.update
      redirect_to bookings_path
    else
      render "edit"
    end
  end

  private

  def set_prestation
    @prestation = Prestation.find(params[:id])
  end

  def prestation_params
    params.require(:prestation).permit(:description)
  end
end
