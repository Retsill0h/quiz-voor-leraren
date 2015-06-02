class RenameChaptersTableNameToBody < ActiveRecord::Migration
  def change
  	rename_column :chapters, :name, :body
  end
end
