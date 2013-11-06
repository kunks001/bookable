require 'rails/railtie'

module Bookable

  class Railtie <  Rails::Railtie
    generators do
       require "/lib/generators/bookable"
    end
  end

end