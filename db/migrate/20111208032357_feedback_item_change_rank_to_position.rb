class FeedbackItemChangeRankToPosition < ActiveRecord::Migration
  def change
    add_column(:feedback_items, :position, :integer)
    remove_column(:feedback_items, :rank, :integer)

  end
end
