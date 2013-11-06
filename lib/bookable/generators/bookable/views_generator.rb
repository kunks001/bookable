module Bookable
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates/views', __FILE__)

      argument :bookable_views_name, :type => :string, :default => "resources"
      
      def generate_bookable_views
        template "_errors.html.erb", "app/views/#{bookable_views_name.pluralize}/_errors.html.erb"
        template "_form.html.erb", "app/views/#{bookable_views_name.pluralize}/_form.html.erb"
        template "edit.html.erb", "app/views/#{bookable_views_name.pluralize}/edit.html.erb"
        template "index.html.erb", "app/views/#{bookable_views_name.pluralize}/index.html.erb"
        template "new.html.erb", "app/views/#{bookable_views_name.pluralize}/new.html.erb"

        template "bookings/_errors.html.erb", "app/views/bookings/_errors.html.erb"
        template "bookings/_form.html.erb", "app/views/bookings/_form.html.erb"
        template "bookings/edit.html.erb", "app/views/bookings/edit.html.erb"
        template "bookings/index.html.erb", "app/views/bookings/index.html.erb"
        template "bookings/new.html.erb", "app/views/bookings/new.html.erb"
        template "bookings/show.html.erb", "app/views/bookings/show.html.erb"
      end

    end
  end
end

