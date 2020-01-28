class Character < ActiveRecord::Base
  validates_presence_of :name, :subclass, :gender
  belongs_to :users
end