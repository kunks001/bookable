class <%= resource_name.capitalize %> < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :bookings
end
