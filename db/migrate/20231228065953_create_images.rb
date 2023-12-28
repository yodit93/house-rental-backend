class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.integer :id
      t.string :url
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
