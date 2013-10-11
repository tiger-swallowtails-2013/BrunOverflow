class Vote < ActiveRecord::Base
  attr_accessible :votable, :user
  belongs_to :user
  belongs_to :votable, polymorphic: true
end

