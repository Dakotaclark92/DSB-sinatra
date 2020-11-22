class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :name, :email
  has_many :characters
end