class CreateForumoffers < ActiveRecord::Migration[5.0]
  def change
    create_table :forumoffers do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.references :offer, foreign_key: true

      t.timestamps
    end
  end
end
