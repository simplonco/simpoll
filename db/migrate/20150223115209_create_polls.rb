class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title
      t.string :author
      t.string :description
      t.string :field
    end
  end
end
