
module Bookable
  module Generators
    class ControllerGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates/controllers', __FILE__)
      
      argument :resource_name, type: :string, default: 'resource'

      def generate_bookable_controller
        template "booking_controller.rb", "app/controllers/bookings_controller.rb"
        template "resource_controller.rb", "app/controllers/#{resource_name_underscore.pluralize}_controller.rb"
        route "resources :#{resource_name_underscore.pluralize} do\n" \
              "\t  resources :bookings\n" \
              "\tend"
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