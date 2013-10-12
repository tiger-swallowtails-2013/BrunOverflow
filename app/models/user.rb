class User < ActiveRecord::Base
  attr_accessible :email, :password
  has_many :answers
  has_many :questions
  has_many :votes

  validates_presence_of :email, :password
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user && (user.password == password)
      user
    else
      nil
    end
  end
end
