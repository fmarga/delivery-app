class ChangeAttributesFromSearchBudget < ActiveRecord::Migration[7.0]
  def change
    change_column :search_budgets, :height, :decimal
    change_column :search_budgets, :width, :decimal
    change_column :search_budgets, :depth, :decimal
  end
end
