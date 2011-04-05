class Period < ActiveRecord::Base
  has_many :journals
  has_many :postings

  def self.current
    last || Period.create( :name => "InitialPeriod")
  end
  def self.period_end!(period_name=nil)
    period_name= "started #{Time.now.to_s}" if period_name.nil?

    transaction do
      # find all accounts and put into array
      accounts = current.postings.all.map! do |posting| posting.account; end.uniq!
      unless accounts.nil?
        need_todo = accounts.inject([]) do |hsh, account|
          hsh << [account, account.balance]
        end

        # do close account
        need_todo.each do |account, balance|
          account.transfer Account.cashbook, balance, "PeriodEnd transfer"
        end

        # switch period
        next_period = Period.create( :name => period_name)
    
        # do open account
        need_todo.each do |account, balance|
          Account.cashbook.transfer account, balance, "PeriodOpen transfer"
        end

      else
        Period.create( :name => period_name)
      end
    end
  end
end
