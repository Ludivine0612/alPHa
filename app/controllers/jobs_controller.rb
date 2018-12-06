class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  private
  def job_params
    params.require(:job).permit(:siret,:name,:last_name, :first_name, :address, :phone_number, :photo)
  end
end
