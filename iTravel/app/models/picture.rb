class Picture < ApplicationRecord
  belongs_to :trip
  default_scope -> { order(created_at: :desc) }
  validates :trip_id, presence: true
  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/ unless Rails.env.test?


end
