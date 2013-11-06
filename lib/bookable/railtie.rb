require 'rails/railtie'

module Bookable

  class Railtie <  Rails::Railtie
    generators do
      require "generators/bookable/install_generator"
      require "bookable"
    end
  end

end