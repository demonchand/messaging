class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :account_type
      t.decimal :balance, :precision => 10, :scale => 2
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
