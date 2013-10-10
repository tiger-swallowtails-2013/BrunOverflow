class User < ActiveRecord::Base
  attr_accessible :name, :password

  validates_presence_of :name, :password
  validates_uniqueness_of :name
end