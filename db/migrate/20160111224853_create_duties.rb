class CreateDuties < ActiveRecord::Migration
  def change
    create_table :duties do |t|
      t.date :date
      t.time :time
      t.string :name

      t.timestamps null: false
    end
  end
end
