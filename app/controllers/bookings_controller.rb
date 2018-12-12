class BookingsController < ApplicationController
  before_action :set_booking, only: [:new, :show, :edit]
  def index
    @bookings = current_user.bookings
    # @bookings = Booking.where.not(latitude: nil, longitude: nil)
    @markers = @bookings.map do |booking|
      {
        lng: booking.longitude,
        lat: booking.latitude,
        infoWindow: { content: render_to_string(partial: "/bookings/map_box", locals: { booking: booking }) }
      }
    end
    gon.bookings = @bookings
    @prestation_users = get_employees_from_bookings(@bookings)

    @events = @bookings.map do |booking|
      prestation = booking.prestations.first
      unless prestation.nil?
        {
          title: booking.prestations.first.activity.name,
          start: booking.start_date,
          end: booking.end_date
        }
      end
     end

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

    @markers = [
      {
        lng: @booking.longitude,
        lat: @booking.latitude,
        infoWindow: { content: render_to_string(partial: "/bookings/map_box", locals: { booking: @booking }) }

      }]

  end

  def edit
  end

  def update
    @booking.update(params[:booking])
    redirect_to booking
  end

  private

  def get_employees_from_bookings(bookings)
    results = {}
    bookings.each do |booking|

      prestation = booking.prestations.first
      unless prestation.nil?
      activity = prestation.activity
      skills = Skill.where(activity: prestation.activity)
      prestation_users = skills
        .map{ |skill| skill.job }
        .select{|job| job.company == booking.company}
        .map{ |job| job.employee }
      results[prestation.id] = prestation_users
    end
    end
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :location)
  end
end
