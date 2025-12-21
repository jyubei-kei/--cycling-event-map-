class Event < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :aid_stations, dependent: :destroy

  scope :published, -> { where(published: true) }
end
