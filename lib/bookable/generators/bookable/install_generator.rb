module Bookable
  module Generators
    class InstallGenerator < Rails::Generators::Base
      argument :resource_name, :type => :string, :default => "resource"
      source_root File.expand_path("../", __FILE__)

      def install
        generate "bookable:resource_model #{resource_name}"
        generate "bookable:booking_model #{resource_name}"
        generate "bookable:controller #{resource_name}"
        generate "bookable:views #{resource_name}"
        generate "bookable:js #{resource_name}"
        generate "bookable:css #{resource_name}"
      end

    end
  end
end