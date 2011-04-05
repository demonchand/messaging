class Journal < ActiveRecord::Base
  after_create :edit_account_type_balance
  
  belongs_to :account
  
  def edit_account_type_balance
  #  case self.from
  #  when "1" then
  #    name = "assert"
  #    credit(name)
  #    name = 
  #  end
    if self.from == "1"
      credit
      debit
      cred.save!
    end
  end
  
  def credit
    cred = Account.find_by_account_type("assert")
    cred.balance = (cred.balance - self.amount)
  end
  
  def debit
    if self.to == "2"
      deb = Account.find_by_account_type("expense")
      deb.balance = (deb.balance + self.amount)
      deb.save!
    end
  end
  def get_the_string
    @name1 = Account.find(1).account_type
  end
end
