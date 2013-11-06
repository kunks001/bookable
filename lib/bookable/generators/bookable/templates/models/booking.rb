require_relative './concerns/bookable'

class Booking < ActiveRecord::Base
  include Bookable
end