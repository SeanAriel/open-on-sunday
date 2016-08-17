class AddStartdateToAvailabilities < ActiveRecord::Migration[5.0]
  def change
    add_column :availabilities, :startdate, :datetime
  end
end
