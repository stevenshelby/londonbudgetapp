class CreateBudgetTypes < ActiveRecord::Migration
  def change
    create_table :budget_types do |t|
      t.string :name
      t.timestamps
    end
  end

end
