class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :email, :string
  	add_column :users, :username, :string
  	add_column :users, :location, :string
  	add_column :users, :about_me, :string
  	add_column :users, :timestamps, :datetime
  	add_column :users, :ecrypted_password, :string
  	remove_column :users, :password_digest
  end
end
