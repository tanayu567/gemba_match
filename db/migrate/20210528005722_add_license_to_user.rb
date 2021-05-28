class AddLicenseToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :license, :text
  end
end
