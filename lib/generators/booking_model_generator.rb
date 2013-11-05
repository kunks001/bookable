class BookingModelGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates/models', __FILE__)

  def generate_booking_model
    copy_file "bookable.rb", "app/models/concerns/bookable.rb"
    copy_file "booking.rb", "app/models/booking.rb"
  end

  def create_booking_migration
    # create_file "db/migrate/#{Time.now.strftime('%Y%l%M%S%w%y')}_create_bookings.rb", migration
    generate "migration CreateBookings start_time:datetime end_time:datetime length:integer resource:belongs_to"
  end

  def generate_datetime_initializer
    copy_file "datetime.rb", "config/initializers/datetime.rb"
  end

  private

  # def migration
  #   "class CreateBookings < ActiveRecord::Migration\n"\
  #     "\tdef change\n"\
  #       "\t\tcreate_table :bookings do |t|\n"\
  #         "\t\t\tt.datetime :start_time\n"\
  #         "\t\t\tt.datetime :end_time\n"\
  #         "\t\t\tt.integer :length\n"\
  #         "\t\t\tt.integer :resource_id\n"\
  #         "\t\t\tt.timestamps\n"\
  #       "\t\tend\n"\
  #     "\tend\n"\
  #   "end"
  # end
  
end