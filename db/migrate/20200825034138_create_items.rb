class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.text :explanation,  null: false
      t.string :name,  null: false
      t.integer :price,  null: false
      t.integer :category_id,  null: false
      t.integer :status_id, null: false
      t.integer :charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :schedule_id, null: false

      t.timestamps
    end
  end
end
