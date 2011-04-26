class CreateParticipations < ActiveRecord::Migration
  def self.up
    create_table :participations do |t|
      t.references :customer
      t.decimal :fee, :precision => 10, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :participations
  end
end
