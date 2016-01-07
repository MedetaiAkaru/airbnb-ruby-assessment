class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :name
			t.string :email
			t.string :encrypted_password
			t.timestamps :created_at
			t.timestamps :updated_at
		end
	end
end