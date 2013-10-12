class Vote < ActiveRecord::Base
  attr_accessible :votable, :user, :value
  belongs_to :user
  belongs_to :votable, polymorphic: true
  validates_uniqueness_of :user_id, scope: :votable_id, scope: :votable_type
end

