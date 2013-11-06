module Bookable
  module Generators
    class CssGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates/assets/stylesheets', __FILE__)

      def generate_css
        template "custom.css", "app/assets/stylesheets/custom.css"
        template "fullcalendar.css", "app/assets/stylesheets/fullcalendar.css"
      end
      
    end
  end
end