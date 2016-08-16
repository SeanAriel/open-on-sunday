class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.references :offer, foreign_key: true
      t.time :date

      t.timestamps
    end
  end
end
