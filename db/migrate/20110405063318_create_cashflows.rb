class CreateCashflows < ActiveRecord::Migration
  def self.up
    create_table :cashflows do |t|
      t.string :from
      t.string :to
      t.decimal :amount, :precision => 10, :scale => 2
      t.date :date
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :cashflows
  end
end
