class CreateLikes < ActiveRecord::Migration
  def change
  	create_table :likes do |t|
  		t.string :post_id
  		t.string :user_id

  		t.timestamps(null: true)
  	end
  end
end
