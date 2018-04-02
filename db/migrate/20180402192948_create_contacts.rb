class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :phone
      t.string :mail
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
