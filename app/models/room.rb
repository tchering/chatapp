class Room < ApplicationRecord
  validates_uniqueness_of :name
  scope :public_rooms, -> { where(is_private: false) }
  # scope :public_rooms, lambda { where(is_private: false) }
  after_create_commit { broadcast_append_to 'rooms' }

  # now in our view this 'rooms' should match turbo_stream and also id of the div in the view
  # <div id="rooms">
  # <h4>Rooms</h4>
  # <%= render @rooms %>
  # </div>

  has_many :messages, dependent: :destroy

  # later we will call this lambda like this | public_rooms = Room.public_rooms
end
