class CreateInsultos < ActiveRecord::Migration[6.0]
  def change
    create_table :insultos do |t|
      t.string :insulto
      t.timestamps
    end

    add_index :insultos, :insulto, unique: true
  end
end
