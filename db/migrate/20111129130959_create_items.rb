class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.date :acquired_on
      t.integer :condition_id
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
