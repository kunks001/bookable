class BookingsController < ApplicationController
  respond_to :html, :xml, :json
  
  before_action :find_<%=resource_name_underscore.singularize%>

  def index
    @bookings = Booking.where("<%=resource_name.singularize%>_id = ? AND end_time >= ?", @<%=resource_name.singularize%>.id, Time.now).order(:start_time)
    respond_with @bookings
  end

  def new
    @booking = Booking.new(<%=resource_name.singularize%>_id: @<%=resource_name.singularize%>.id)
  end

  def create
    @booking =  Booking.new(params[:booking].permit(:<%=resource_name.singularize%>_id, :start_time, :length))
    @booking.<%=resource_name.singularize%> = @<%=resource_name.singularize%>
    if @booking.save
      redirect_to <%=resource_name.singularize%>_bookings_path(@<%=resource_name.singularize%>, method: :get)
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
      redirect_to <%=resource_name.singularize%>_bookings_path(@<%=resource_name.singularize%>)
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

    if @booking.update(params[:booking].permit(:<%=resource_name.singularize%>_id, :start_time, :length))
      flash[:notice] = 'Your booking was updated succesfully'

      if request.xhr?
        render json: {status: :success}.to_json
      else
        redirect_to <%=resource_name.singularize%>_bookings_path(@<%=resource_name.singularize%>)
      end
    else
      render 'edit'
    end
  end

  private

  def save booking
    if @booking.save
        flash[:notice] = 'booking added'
        redirect_to <%=resource_name.singularize%>_booking_path(@<%=resource_name.singularize%>, @booking)
      else
        render 'new'
      end
  end

  def find_<%=resource_name.singularize%>
    if params[:<%=resource_name.singularize%>_id]
      @<%=resource_name.singularize%> = <%=resource_name_camelize.singularize%>.find_by_id(params[:<%=resource_name.singularize%>_id])
    end
  end

end
