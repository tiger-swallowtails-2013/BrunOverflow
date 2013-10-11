class User < ActiveRecord::Base
  attr_accessible :name, :password
  has_many :answers
  has_many :questions
  has_many :votes

  validates_presence_of :name, :password
  validates_uniqueness_of :name
end
