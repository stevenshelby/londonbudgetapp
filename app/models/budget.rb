class Budget < ActiveRecord::Base
  has_one :category
  belongs_to :budget_type
end
