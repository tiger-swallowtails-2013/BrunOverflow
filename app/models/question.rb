class Question < ActiveRecord::Base
  attr_accessible :title, :content
  validates_presence_of :title, :content
  has_many :answers
  belongs_to :user
end