class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.float :price
      t.text :description
      t.float :latitude
      t.float :longitude
      t.boolean :sold
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
