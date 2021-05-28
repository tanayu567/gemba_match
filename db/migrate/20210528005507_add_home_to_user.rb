class AddHomeToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :home, :string
  end
end
