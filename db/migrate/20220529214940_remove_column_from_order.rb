class RemoveColumnFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :status, :integer
  end
end
