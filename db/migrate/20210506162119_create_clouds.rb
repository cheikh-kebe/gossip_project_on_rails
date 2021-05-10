class CreateClouds < ActiveRecord::Migration[5.2]
  def change
    create_table :clouds do |t|
      t.string :name
      t.belongs_to :tag, foreign_key: true
      t.belongs_to :gossip, foreign_key: true

      t.timestamps
    end
  end
end
