class Room < ApplicationRecord
	belongs_to :owner, class_name: "User"
	belongs_to :visitor, class_name: "User", optional: true
end
