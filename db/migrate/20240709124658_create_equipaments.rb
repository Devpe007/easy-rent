class CreateEquipaments < ActiveRecord::Migration[7.1]
  def change
    create_table :equipaments do |t|
      t.string :name, null: false
      t.string :serial_number, null: false

      t.timestamps
    end

    add_index :equipaments, :serial_number, unique: true
  end
end
