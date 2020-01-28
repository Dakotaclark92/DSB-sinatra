class Character < ActiveRecord::Base
  validates_presence_of :name, :class, :gender
end