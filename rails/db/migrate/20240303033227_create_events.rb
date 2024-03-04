class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events, id: :uuid do |t|
      t.integer :sport
      t.datetime :event_date
      t.string :title
      t.string :championship
      t.integer :broadcast_platform
      t.string :url
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
