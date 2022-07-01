class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :artist, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
