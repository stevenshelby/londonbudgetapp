class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :expenditure
      t.integer :revenue
      t.string :ancestry
      t.string :budget_id
    end


  end
end
