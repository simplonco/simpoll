class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :poll
      t.string :content
    end
    create_table :choices do |t|
      t.belongs_to :question
      t.string :value
    end
  end
end
