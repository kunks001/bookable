module Bookable
  module Generators
    class InstallGenerator < Rails::Generators::Base
      argument :resource_name, :type => :string, :default => "resource"
      source_root File.expand_path("../", __FILE__)

      def install
        generate "bookable:resource_model #{options[:resource_name] || ''}"
        generate "bookable:booking_model"
        generate "bookable:controller #{options[:resource_name] || ''}"
        generate "bookable:views"
        generate "bookable:js"
        generate "bookable:css"
      end

    end
  end
end