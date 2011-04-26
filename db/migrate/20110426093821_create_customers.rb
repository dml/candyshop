class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.decimal :deposit, :precision => 10, :scale => 2, :default => 0.00

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
