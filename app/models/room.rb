class Room < ApplicationRecord
  validates_uniqueness_of :name
  scope :public_rooms, -> { where(is_private: false) }
  # scope :public_rooms, lambda { where(is_private: false) }

  # later we will call this lambda like this | public_rooms = Room.public_rooms
end
