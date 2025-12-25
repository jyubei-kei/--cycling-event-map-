class Event < ApplicationRecord
  validates :name, presence: true
  validates :user_id, uniqueness: { scope: :event_id }
  belongs_to :user
  belongs_to :event

  has_many :aid_stations, dependent: :destroy
  has_many :courses

  scope :published, -> { where(published: true) }
end
