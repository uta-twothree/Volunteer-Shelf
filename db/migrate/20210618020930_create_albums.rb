class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|

      t.string :name,        null: false
      t.text :content,       null: false
      t.integer :area_id,    null: false
      t.integer :theme_id,   null: false
      t.references :user,    foreign_key: true
      t.timestamps
    end
  end
end
