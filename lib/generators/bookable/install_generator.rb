require 'rails/generators'

module Bookable
  module Generators
    class InstallGenerator < Rails::Generators::Base
      argument :resource_name, :type => :string, :default => "resource"
      source_root File.expand_path("../", __FILE__)

      # desc "Some description of my generator here"

      # class_option :resource_name, :type => :string, :default => "resource", :desc => "My Option"

      def install
        generate "bookable:resource_model #{options[:resource_name] || ''}"
        generate "bookable:booking_model"
        generate "bookable:controller #{options[:resource_name] || ''}"
        generate "bookable:views"
        generate "bookable:js"
        generate "bookable:css"
      end
      # def self.source_root
      #   @source_root ||= File.join(File.dirname(__FILE__), '.')
      # end
    end
  end
end