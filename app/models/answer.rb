class Answer < ActiveRecord::Base
  attr_accessible :body, :question_id

  validates_presence_of :body
  belongs_to :question, :counter_cache => true

  belongs_to :user
  has_many :votes, :as => :votable
end
