class Topic < ActiveRecord::Base
  has_many :feedback_items
end
