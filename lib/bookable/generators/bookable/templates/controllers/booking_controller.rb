class BookingsController < ApplicationController
  respond_to :html, :xml, :json
  
  before_action :find_<%=resource_name_underscore%>

  def index
    @bookings = Booking.where("<%=resource_name%>_id = ? AND end_time >= ?", @<%=resource_name%>.id, Time.now).order(:start_time)
    respond_with @bookings
  end

  def new
    @booking = Booking.new(<%=resource_name%>_id: @<%=resource_name%>.id)
  end

  def create
    @booking =  Booking.new(params[:booking].permit(:<%=resource_name%>_id, :start_time, :length))
    @booking.<%=resource_name%> = @<%=resource_name%>
    if @booking.save
      redirect_to <%=resource_name%>_bookings_path(@<%=resource_name%>, method: :get)
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
    if @booking.destroy
      flash[:notice] = "Booking: #{@booking.start_time.strftime('%e %b %Y %H:%M%p')} to #{@booking.end_time.strftime('%e %b %Y %H:%M%p')} deleted"
      redirect_to <%=resource_name%>_bookings_path(@<%=resource_name%>)
    else
      render 'index'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    # @booking.<%=resource_name%> = @<%=resource_name%>

    if @booking.update(params[:booking].permit(:<%=resource_name%>_id, :start_time, :length))
      flash[:notice] = 'Your booking was updated succesfully'

      if request.xhr?
        render json: {status: :success}.to_json
      else
        redirect_to <%=resource_name%>_bookings_path(@<%=resource_name%>)
      end
    else
      render 'edit'
    end
  end

  private

  def save booking
    if @booking.save
        flash[:notice] = 'booking added'
        redirect_to <%=resource_name%>_booking_path(@<%=resource_name%>, @booking)
      else
        render 'new'
      end
  end

  def find_<%=resource_name%>
    if params[:<%=resource_name%>_id]
      @<%=resource_name%> = <%=resource_name_camelize%>.find_by_id(params[:<%=resource_name%>_id])
    end
  end

end
