class AddAvailabilityToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_reference :meetings, :availability, foreign_key: true
  end
end
