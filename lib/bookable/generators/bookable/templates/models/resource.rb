class <%= resource_name_camelize.singularize %> < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :bookings
end
