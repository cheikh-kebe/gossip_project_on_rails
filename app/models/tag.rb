class Tag < ApplicationRecord
  has_many :gossips, through: :clouds
end
