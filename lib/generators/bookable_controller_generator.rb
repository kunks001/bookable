class BookableControllerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates/controllers', __FILE__)
  
  argument :resource_name, type: :string, default: 'resource'

  def generate_bookable_controller
    template "booking_controller.rb", "app/controllers/bookings_controller.rb"
    template "resource_controller.rb", "app/controllers/#{file_name}s_controller.rb"
    route "resources :#{file_name}s do\n" \
          "\t  resources :bookings\n" \
          "\tend"
  end

  private

    def file_name
      resource_name.underscore
    end
end
