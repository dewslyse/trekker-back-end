class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name, null: false
      t.string :last_name
      t.string :phone_number

      t.timestamps
    end
  end
end
