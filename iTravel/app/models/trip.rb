class Trip < ApplicationRecord
  belongs_to :user
  has_many :cities, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :title, presence: true
  validates :country, presence: true

  default_scope -> { order(created_at: :desc) }

  acts_as_votable

  def self.search(search)
    # Title is for the above case, the OP incorrectly had 'name'
    where("lower(country) LIKE ?", "%#{search}%")

  end


end
