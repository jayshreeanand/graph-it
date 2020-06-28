class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :description
      t.string :attachment
      t.string :location
      t.string :latitude
      t.string :longitude
      t.integer :kind, null: false

      t.timestamps
    end
  end
end
