class CreateProperties < ActiveRecord::Migration
	def change
		create_table :properties do |t|
			t.string :title
			t.text :description
			t.integer :price
			t.string :image
			t.integer :user_id
			t.timestamps :created_at
			t.timestamps :updated_at
		end
	end
end