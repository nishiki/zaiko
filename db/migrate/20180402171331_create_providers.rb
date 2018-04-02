class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :name, null: false, unique: true
      t.string :address

      t.timestamps
    end
  end
end
