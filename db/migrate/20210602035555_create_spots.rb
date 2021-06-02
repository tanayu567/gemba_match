class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :s_name
      t.string :address
      t.date :start
      t.date :last
      t.string :money
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :spots, [:user_id, :created_at]
  end
end
