class Account < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  has_many :postings

#  validates_presence_of :account_id, :account_type

  def self.cashbook
    find_by_description("CreditableGlobalCashbook") || create( :description => "CreditableGlobalCashbook")
  end

  def transfer( destination, amount, description=nil)
    Journal.transfer self, destination, amount, description
  end
  def balance
    postings.inject(0.to_money) do |result, amount|
      result + amount
    end
  end
end
