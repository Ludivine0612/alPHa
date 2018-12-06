class BookingsController < ApplicationController
  before_action :set_booking, only: [:index, :new, :show, :edit]
  def index
    @bookings = Booking.all
  end

  def new
    @user = current_user
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      redirect_to new_user_booking_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @booking.update(params[:booking])
    redirect_to booking
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :location)
  end
end
