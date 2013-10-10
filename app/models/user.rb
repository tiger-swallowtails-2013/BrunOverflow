class User < ActiveRecord::Base
  attr_accessible :name, :password
  has_many :answers
  has_many :questions

  validates_presence_of :name, :password
  validates_uniqueness_of :name

  def self.authorize(username, password)
    user = User.where('name = ? AND password = ?', username, password).first
  end
end