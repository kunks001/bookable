class BookableInstallGenerator < Rails::Generators::Base

  argument :resource_name, :type => :string, :default => "resource"

  def install
    generate "resource_model #{resource_name || ''}"
    generate "booking_model"
    generate "bookable_controller"
    generate "bookable_views"
    generate "bookable_js"
    generate "bookable_css"
  end

end