class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    # @bookings = Booking.all
    @booking = Booking.new
    @room = Room.new
    @rooms = Room.all
    @selected_date = DateTime.now
    @bookings = Booking.where(:start_time => @selected_date.beginning_of_day..@selected_date.end_of_day)

    @timeNow = Time.now
    @startTime = @timeNow.beginning_of_day() + (8*60*60)
    @endTime = @timeNow.beginning_of_day() + (18*60*60)

  end

  def month
    @bookings = Booking.all
    @rooms = Room.all
    @room = Room.new
  end

  def week
    @start_date = params.fetch(:start_date, Date.today).to_date
    @date_range = (@start_date..(@start_date)).to_a
    @week_range = (@start_date.beginning_of_week..(@start_date.beginning_of_week+ 4.day)).to_a
    @timeNow = Time.now
    @startTime = @timeNow.beginning_of_day() + (8*60*60)
    @endTime = @timeNow.beginning_of_day() + (18*60*60)
    @bookings = Booking.all
    @rooms = Room.all
    @room = Room.new
    @todaysDate = Time.now
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @bookings = Booking.all
    @rooms = Room.all
  end

  # GET /bookings/new
  def new
    @rooms = Room.all
    @booking = Booking.new
    @users = User.all
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)


    respond_to do |format|
      if @booking.save
        format.html { redirect_to week_path, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: month_path }
      else
        format.html { redirect_to week_path, notice: 'Booking overlaps with current booking' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.permit(:start_time, :finish_time, :description, :room_id, :room_name, :room_colour)
    end
end
