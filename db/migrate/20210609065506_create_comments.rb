class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user,foreign_key: true
      t.references :spot, foreign_key: true
      t.text :text, null: false
      t.timestamps
    end
  end
end
