class CreateBookings < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.string :date_start
			t.string :date_end
			t.integer :user_id
			t.integer :property_id
			t.timestamps :created_at
			t.timestamps :updated_at
		end
	end
end