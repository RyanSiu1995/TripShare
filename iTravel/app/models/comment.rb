class Comment < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  validates :trip_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  default_scope -> { order(created_at: :desc) }

end
