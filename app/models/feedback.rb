class Feedback < ActiveRecord::Base
  has_many :feedback_items
  accepts_nested_attributes_for :feedback_items


end
