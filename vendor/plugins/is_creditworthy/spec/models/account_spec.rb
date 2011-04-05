require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Account do
  fixtures :accounts

  it "should start with a balance of 0" do
    acc = Account.create :owner_id => 1, :owner_type => "User"
    acc.balance.should == 0.to_money
  end

  it 'should have #transfer' do
    @account_one.public_methods.should include( "transfer")
  end

  it "should transfer credits through the 'transfer' method" do
    @account_one.transfer @account_two, 10.to_money
    @account_one.balance.should == -10.to_money
    @account_two.balance.should == 10.to_money
  end

  it 'should have #balance' do
    @account_one.public_methods.should include( "transfer")
  end

  it "should have a balance of 20 after two debits" do
    @account_one.transfer @account_two, 10.to_money
    @account_one.transfer @account_two, 10.to_money

    # this is a comment
    @account_one.balance.should == -20.to_money
    @account_two.balance.should == 20.to_money
  end

  describe 'introducing the global cashbook' do
    it 'should have self#cashbook' do
      Account.public_methods.should include( "cashbook")
    end

    it "should be singularily created" do
      cb= Account.cashbook
      cb.should == Account.cashbook
    end

    it "should include the Account methods" do
      cb= Account.cashbook
      cb.public_methods.should include( "balance")
      cb.public_methods.should include( "postings")
    end
  end

  describe 'using the global cashbook for bringing assets into the system' do
    before(:each) do
      @cashbook = Account.cashbook
    end

    it 'should correctly reflect an asset brought into the system' do
      @cashbook.transfer @account_one, 100.to_money

      @cashbook.balance.should == -100.to_money
      @account_one.balance.should == 100.to_money
    end
    it 'should correctly reflect an asset taken out of the system' do
      @account_one.transfer @cashbook, 100.to_money

      @cashbook.balance.should == 100.to_money
      @account_one.balance.should == -100.to_money
    end
    it 'should correctly reflect a round trip' do
      @cashbook.transfer @account_one, 100.to_money
      @account_one.transfer @account_two, 100.to_money
      @account_two.transfer @cashbook, 100.to_money

      @cashbook.balance.should == 0.to_money
      @account_one.balance.should == 0.to_money
      @account_two.balance.should == 0.to_money
    end
  end
end

class AlwaysPositiveAccount < Account
  def check_after_transfer
    raise Error if balance < 0
  end
end

describe AlwaysPositiveAccount do
  fixtures :accounts

  describe 'using subclasses to implement balance checking' do
    before(:each) do
      @cashbook = Account.cashbook
    end

    it 'should raise an exception on negative balance' do
      positiveAccount = AlwaysPositiveAccount.create
      lambda {
        positiveAccount.transfer @cashbook, 100.to_money
      }.should raise_error
    end
  end
end
