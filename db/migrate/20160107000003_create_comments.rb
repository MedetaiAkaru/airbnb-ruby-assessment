class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.string :commenttext
			t.integer :user_id
			t.integer :property_id
			t.timestamps :created_at
			t.timestamps :updated_at
		end
	end
end