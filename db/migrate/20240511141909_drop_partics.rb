class DropPartics < ActiveRecord::Migration[7.1]
  def up
    drop_table :partics
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
