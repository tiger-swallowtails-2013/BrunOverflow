class User < ActiveRecord::Base
  attr_accessible :name, :password, :email
  has_many :answers
  has_many :questions

  validates_presence_of :name, :password
  validates_uniqueness_of :name
end
