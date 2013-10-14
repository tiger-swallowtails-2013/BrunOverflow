class AddVotesCountToQuestions < ActiveRecord::Migration

  def self.up
    add_column :questions, :votes_count, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :questions, :votes_count
  end

end
