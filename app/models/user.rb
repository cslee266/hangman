class User < ApplicationRecord
	include Filterable

	has_many :relationships, class_name: "Relationship", foreign_key: "user_id", dependent: :destroy
	has_many :friends, through: :relationships, source: :friend
	has_one :room, class_name: "Room", foreign_key: "owner_id", dependent: :destroy
	has_many :visitors, through: :rooms, source: :visitor

	validates :email, uniqueness: true, format: { with: /(^([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*$)/i }
	validates :password, format: { with: /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/,
								   multiline: true }

	scope :search_name, -> (name) { where("name ILIKE ?", "%#{name}%") }
	
	has_secure_password

	enum role: [:visitor, :owner]
end
