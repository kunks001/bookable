module Bookable
  module Generators
    class BookingModelGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates/models', __FILE__)

      argument :resource_name, :type => :string, :default => "resource"

      def generate_booking_model
        copy_file "booking.rb", "app/models/booking.rb"
        template "bookable.rb", "app/models/concerns/bookable.rb"
      end

      def create_booking_migration
        generate "migration CreateBookings start_time:datetime end_time:datetime length:integer #{resource_name_underscore.singularize}:belongs_to"
      end

      def generate_datetime_initializer
        copy_file "datetime.rb", "config/initializers/datetime.rb"
      end

      private

        def resource_name_underscore
          resource_name.underscore
        end

        def resource_name_camelize
          resource_name.camelize
        end
      
    end
  end
end
