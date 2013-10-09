class CreateAnswers < ActiveRecord::Migration
  def up
    create_table :answers do |t|
      t.text :body
    end
  end

  def down
    drop_table :answers
  end
end
