class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  validates :user_id, presence: true
  validates :friend_id, presence: true

  def self.friends?(user, friend_id)
  	user.relationships.where(friend_id: friend_id).exists?
  end
end
