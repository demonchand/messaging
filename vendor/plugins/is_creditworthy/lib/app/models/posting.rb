class Posting < ActiveRecord::Base
  belongs_to :journal
  belongs_to :account
  belongs_to :period

  composed_of :amount, :class_name => "Money", :mapping => [%w(cents cents), %w(currency currency)]

  named_scope :current, lambda { { :conditions => ['period_id == ?', Period.current.id] } }

  validates_presence_of :account_id, :period_id
end
