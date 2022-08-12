class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.decimal :fee
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
