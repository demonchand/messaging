class CreateAssertAccounts < ActiveRecord::Migration
  def self.up
    create_table :assert_accounts do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :assert_accounts
  end
end
