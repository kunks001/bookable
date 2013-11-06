require "generator_spec"
require "./lib/bookable/generators/bookable/install_generator"

describe Bookable::Generators::InstallGenerator, "using custom matcher", type: :generator do
  destination File.expand_path("../test_temp", __FILE__)
  arguments %w(tennis_court)

  before do
    prepare_destination
    run_generator
  end

  specify do
    destination_root.should have_structure {
      no_file "booking_model.rb"
      directory "app" do
        directory "models" do
          file "booking_model.rb" do
            contains "class Booking"
          end
        end
      end
    }
  end
end
