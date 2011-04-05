ActiveRecord::Schema.define(:version => 0) do
  create_table :periods, :force => true do |t|
    t.string     :name
    t.timestamps
  end
  create_table :accounts, :force => true do |t|
    t.belongs_to :owner, :polymorphic => true
    t.string     :description
    t.timestamps
  end
  create_table :journals, :force => true do |t|
    t.string     :type
    t.belongs_to :period
    t.string     :description
    t.timestamps
  end
  create_table :postings, :force => true do |t|
    t.belongs_to :journal
    t.belongs_to :account
    t.belongs_to :period
    t.integer :cents
    t.string  :currency
    t.timestamps
  end

  create_table :is_creditworthy_tests, :force => true do |t|
    t.string     :name
    t.timestamps
  end
end
