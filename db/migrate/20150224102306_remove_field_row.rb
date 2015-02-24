class RemoveFieldRow < ActiveRecord::Migration
  def change
    remove_column :polls, :field
  end
end
