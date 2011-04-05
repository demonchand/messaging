class CreateJournals < ActiveRecord::Migration
  def self.up
    create_table :journals do |t|
      t.string :from
      t.string :to
      t.text :description
      t.decimal :amount, :precision => 10, :scale => 2
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :journals
  end
end
