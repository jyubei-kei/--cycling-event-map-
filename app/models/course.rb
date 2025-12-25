class Course < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :route_url, presence: true
end
