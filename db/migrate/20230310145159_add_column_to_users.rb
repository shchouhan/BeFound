class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :contact, :string
    add_column :users, :address, :text
    add_column :users, :user_type, :integer
    add_column :users, :qualification, :text
  end
end
