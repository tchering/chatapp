class User < ApplicationRecord
  validates_uniqueness_of :username
  validates :username, presence: true, length: { minimum: 3, maximum: 25 }
  scope :all_except, ->(user) { where.not(id: user) }
  # scope :all_except, lambda { |user| where.not(id: user) }
  after_create_commit { broadcast_prepend_to 'users' }

  # now in our view this 'users' should match turbo_stream and also id of the div in the view
  # <div id="users">
  # <h4>Rooms</h4>
  # <%= render @users %>
  # </div>

  has_many :messages

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
