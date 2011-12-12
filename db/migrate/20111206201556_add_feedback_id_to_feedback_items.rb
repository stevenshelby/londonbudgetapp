class AddFeedbackIdToFeedbackItems < ActiveRecord::Migration
  def change
    add_column(:feedback_items, :feedback_id, :integer)
  end
end
