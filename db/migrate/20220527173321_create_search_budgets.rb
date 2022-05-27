class CreateSearchBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :search_budgets do |t|
      t.integer :height
      t.integer :width
      t.integer :depth
      t.integer :weight
      t.integer :volume
      t.integer :distance
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
