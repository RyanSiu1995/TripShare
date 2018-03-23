class Picture < ApplicationRecord
  belongs_to :trip
  default_scope -> { order(created_at: :desc) }
  validates :trip_id, presence: true
  validates :image, presence: true
  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100>" }, default_url: "https://lorempixel.com/300/300/nature/1"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


end
