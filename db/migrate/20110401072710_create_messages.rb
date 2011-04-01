class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :from
      t.string :to
      t.string :subject
      t.text :body
      t.datetime :date
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
