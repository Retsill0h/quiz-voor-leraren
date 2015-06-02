class AddUserNameToTableUsers < ActiveRecord::Migration
  def change
  	add_column :Users, :user_name, :string
  end
end
