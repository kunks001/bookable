require 'rails/railtie'

module Bookable

  class Railtie <  Rails::Railtie
    generators do
      require 'generators/resource_model.rb'
      require 'generators/booking_model.rb'
      require 'generators/bookable_controller.rb'
      require 'generators/views_generator.rb'
    end
  end

end