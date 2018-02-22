class Trip < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :country, presence: true
  default_scope -> { order(created_at: :desc) }

end
