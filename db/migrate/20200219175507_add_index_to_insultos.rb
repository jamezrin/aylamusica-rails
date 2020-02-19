class AddIndexToInsultos < ActiveRecord::Migration[6.0]
  def change
    add_index :insultos, :insulto, unique: true
  end
end
