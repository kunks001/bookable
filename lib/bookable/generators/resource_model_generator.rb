class ResourceModelGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates/models', __FILE__)
  argument :resource_name, :type => :string, :default => "resource"

  def generate_resource_model
    copy_file "resource.rb", "app/models/#{resource_name}.rb"
  end

  def create_resource_migration
     generate "migration Create#{resource_name.camelize.pluralize} name:string"
  end
  
end

