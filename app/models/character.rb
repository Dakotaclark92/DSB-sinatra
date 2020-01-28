class Character < ActiveRecord::Base
  validates_presence_of :name, :class, :gender
  belongs_to User
end