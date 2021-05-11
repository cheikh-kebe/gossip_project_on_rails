class Tag < ApplicationRecord
  has_many :gossips, through: :clouds

  validates :title, presence: true
end
