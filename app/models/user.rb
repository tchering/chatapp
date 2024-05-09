class User < ApplicationRecord
  validates_uniqueness_of :username
  scope :all_except, ->(user) { where.not(id: user) }
  # scope :all_except, lambda { |user| where.not(id: user) }
end