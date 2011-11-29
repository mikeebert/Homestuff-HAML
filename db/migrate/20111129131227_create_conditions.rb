class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :shape

      t.timestamps
    end
  end
end
