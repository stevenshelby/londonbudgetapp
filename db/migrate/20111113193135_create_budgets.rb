class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :name
      t.datetime :year
      t.string :filename
      t.integer :category_id
    end
  end
end
