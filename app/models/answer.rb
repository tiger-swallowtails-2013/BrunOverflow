class Answer < ActiveRecord::Base
  attr_accessible :body, :question_id

  validates_presence_of :body
  belongs_to :question
  belongs_to :user
end