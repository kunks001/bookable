module Bookable
  module Generators
    class ResourceModelGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates/models', __FILE__)
      argument :resource_name, :type => :string, :default => "resource"

      def generate_resource_model
        template "resource.rb", "app/models/#{resource_name_underscore.singularize}.rb"
      end

      def create_resource_migration
        generate "migration Create#{resource_name_camelize.pluralize} name:string"
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

