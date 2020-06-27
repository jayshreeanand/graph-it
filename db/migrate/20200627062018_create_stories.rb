class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
