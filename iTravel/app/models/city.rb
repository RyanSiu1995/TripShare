class City < ApplicationRecord
  belongs_to :trip
  validates :trip_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }


end
