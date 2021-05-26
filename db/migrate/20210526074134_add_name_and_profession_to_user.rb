class AddNameAndProfessionToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :profession, :integer, null: false ,default: 0
  end
end
