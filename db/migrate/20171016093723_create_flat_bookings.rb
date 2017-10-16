class CreateFlatBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :flat_bookings do |t|
      t.integer :agreement_amount
      t.integer :base_price
      t.integer :area
      t.datetime :date_of_booking

      t.timestamps
    end
  end
end
