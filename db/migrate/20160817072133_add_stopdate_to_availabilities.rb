class AddStopdateToAvailabilities < ActiveRecord::Migration[5.0]
  def change
    add_column :availabilities, :stopdate, :datetime
  end
end
