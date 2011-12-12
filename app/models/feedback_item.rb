class FeedbackItem < ActiveRecord::Base
  belongs_to :topic
  belongs_to :feedback
  accepts_nested_attributes_for :topic

  acts_as_list
end
