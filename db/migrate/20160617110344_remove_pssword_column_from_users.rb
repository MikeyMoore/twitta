class RemovePsswordColumnFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :ecrypted_password
  end
end
