class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.text :explanation,  null: false
      t.string :name,  null: false
      t.integer :price,  null: false
      t.integer :category,  null: false
      t.integer :status, null: false
      t.integer :charge, null: false
      t.integer :area, null: false
      t.integer :date, null: false

      t.timestamps
    end
  end
end
