class CreateBookings < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.datetime :date_start
			t.datetime :date_end
			t.text :extra
			t.integer :user_id
			t.integer :property_id
			t.timestamps :created_at
			t.timestamps :updated_at
		end
	end
end