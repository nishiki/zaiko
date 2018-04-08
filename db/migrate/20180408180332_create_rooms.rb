class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false, uniqueness: true
      t.references :datacenter, foreign_key: true

      t.timestamps
    end
  end
end
