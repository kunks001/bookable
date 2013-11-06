class <%= resource_name_camelize %> < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :bookings
end
