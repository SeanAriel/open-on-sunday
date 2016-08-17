class RemoveDateFromAvailabilities < ActiveRecord::Migration[5.0]
  def change
    remove_column :availabilities, :date, :time
  end
end
