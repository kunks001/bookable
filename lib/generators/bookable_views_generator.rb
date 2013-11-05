class BookableViewsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates/views', __FILE__)

  argument :bookable_views_name, :type => :string, :default => "resources"
  
  def generate_bookable_views
    template "_errors.html.erb", "app/views/#{folder_name}/_errors.html.erb"
    template "_form.html.erb", "app/views/#{folder_name}/_form.html.erb"
    template "edit.html.erb", "app/views/#{folder_name}/edit.html.erb"
    template "index.html.erb", "app/views/#{folder_name}/index.html.erb"
    template "new.html.erb", "app/views/#{folder_name}/new.html.erb"

    template "bookings/_errors.html.erb", "app/views/bookings/_errors.html.erb"
    template "bookings/_form.html.erb", "app/views/bookings/_form.html.erb"
    template "bookings/edit.html.erb", "app/views/bookings/edit.html.erb"
    template "bookings/index.html.erb", "app/views/bookings/index.html.erb"
    template "bookings/new.html.erb", "app/views/bookings/new.html.erb"
    template "bookings/show.html.erb", "app/views/bookings/show.html.erb"

    # template "bookings/custom.js", "app/assets/javascripts/custom.js"
    # template "bookings/fullcalendar.js", "app/assets/javascripts/fullcalendar.js"
    # template "bookings/calendar-editable.js", "app/assets/javascripts/calendar-editable.js"

    # template "bookings/custom.css", "app/assets/stylesheets/custom.css"
    # template "bookings/fullcalendar.css", "app/assets/stylesheets/fullcalendar.css"
  end
  
  private

    def folder_name
      bookable_views_name.underscore
    end
end
