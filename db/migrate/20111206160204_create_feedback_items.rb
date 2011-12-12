class CreateFeedbackItems < ActiveRecord::Migration
  def change
    create_table :feedback_items do |t|
      t.integer :topic_id
      t.integer :rank
      t.integer :percentage

      t.timestamps
    end
  end
end
