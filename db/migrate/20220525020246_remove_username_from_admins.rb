class RemoveUsernameFromAdmins < ActiveRecord::Migration[7.0]
  def change
    remove_column :admins, :username, :string
  end
end
