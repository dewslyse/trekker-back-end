class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :city_name
      t.text :description
      t.string :image_url 
      t.references :user, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
