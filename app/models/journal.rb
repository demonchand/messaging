class Journal < ActiveRecord::Base
  after_create :edit_account_type_balance
  
  belongs_to :account
  
  def edit_account_type_balance
#######    if self.from == "1"
#######      credit
#######      debit
#######      cred.save!
#######    end
#######  end
#######  
#######  def credit
#######    cred = Account.find_by_account_type("assert")
#######    cred.balance = (cred.balance - self.amount)
#######  end
#######  
#######  def debit
#######    if self.to == "2"
#######      deb = Account.find_by_account_type("expense")
#######      deb.balance = (deb.balance + self.amount)
#######      deb.save!
    #######    end

    credit(self.from)
    debit(self.to)
  end


  ## This is my another way of working style Above is the old and that
    ## is working
    
#    get_the_string_and_value(self.from, self.to)

  def credit(val1)
    cred = Account.find(val1.to_i)
    cred.update_attributes(:balance => cred.balance - self.amount)
    cred.save!
  end
  def debit(val2)
    debt = Account.find(val2.to_i)
    debt.update_attributes(:balance => debt.balance + self.amount)
  end
  def get_the_string_and_value(val1, val2)
    @credit_bal = Account.find(val1.to_i).balance
    @debit_bal = Account.find(val2.to_i).balance
  end
end

