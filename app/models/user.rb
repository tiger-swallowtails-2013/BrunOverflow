class User < ActiveRecord::Base
  attr_accessible :email, :password
  has_many :answers
  has_many :questions

  validates_presence_of :email, :password
  validates_uniqueness_of :email
end