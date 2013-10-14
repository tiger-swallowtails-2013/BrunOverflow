class Vote < ActiveRecord::Base
  attr_accessible :votable, :user_id, :value
  belongs_to :user
  belongs_to :votable, polymorphic: true, counter_cache: true
  validates_uniqueness_of :user_id, scope: :votable_id, scope: :votable_type
end

