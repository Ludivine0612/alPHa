class PrestationsController < ApplicationController
  before_action :set_prestation, only: [:show, :edit, :update]
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
    employee = User.find(prestation_params[:job].to_i)
    @prestation.job = Job.where(company: @prestation.booking.company).where(employee: employee).first
    if @prestation.save
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
    params.require(:prestation).permit(:description, :job)
  end
end
