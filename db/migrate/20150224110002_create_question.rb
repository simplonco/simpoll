class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :polls
      t.string :content
    end
    create_table :choices do |t|
      t.belongs_to :questions
      t.string :value
    end
  end
end
