class Journal < ActiveRecord::Base
  after_create :edit_account_type_balance
  
  belongs_to :account
  
  def edit_account_type_balance
    if self.from = "assert"
      aa = Account.find_by_account_type(self.from.to_s)
      aa.balance = (aa.balance - self.amount)
      aa.save!
    end
  end
end
