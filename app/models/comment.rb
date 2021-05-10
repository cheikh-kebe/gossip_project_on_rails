class Comment < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes
  belongs_to :gossip
  belongs_to :tag, optional: true
end
