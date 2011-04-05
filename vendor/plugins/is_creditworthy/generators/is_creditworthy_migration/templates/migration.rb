class IsCreditworthyMigration < ActiveRecord::Migration
 
  def self.up
    create_table :periods do |t|
      t.string     :name
      t.timestamps
    end
    create_table :accounts do |t|
      t.belongs_to :owner, :polymorphic => true
      t.string     :description
      t.timestamps
    end
    create_table :journals do |t|
      t.string     :type
      t.belongs_to :period
      t.string     :description
      t.timestamps
    end
    create_table :postings do |t|
      t.belongs_to :journal
      t.belongs_to :account
      t.belongs_to :period
      t.integer :cents
      t.string  :currency
      t.timestamps
    end
  end
 
  def self.down
    drop_table :periods
    drop_table :accounts
    drop_table :journals
    drop_table :postings
  end 
end
