class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :commenter_id
      t.integer :photo_id
      t.time :schedule_time
      t.boolean :pin
      t.date :schedule_date

      t.timestamps
    end
  end
end
