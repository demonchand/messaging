require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Period do
  describe 'handling #current' do
    it 'should autogenerate a period even when there is none there' do
      Period.count.should == 0
      Period.current.should be_a_kind_of(Period)
      Period.count.should == 1
    end
    it 'should provide the current period' do
      p = Period.current
      p.should == Period.last
    end
    it 'should provide the last period when periods already exist' do
      1.upto(3) do |num|
        Period.create :name => "Period_#{num}"
      end
      p = Period.current
      p.should == Period.last
    end
  end

  describe 'handling #period_end!' do
    it "should have the correct name" do
      Period.period_end! "next period"
      Period.current.name.should == "next period"
    end
    it "should make up a name if none is given" do
      Period.period_end!
      Period.current.name.should_not == ""
    end
    it "should change the current period after #period_end!" do
      p_before = Period.current
      Period.period_end!
      p_after = Period.current
      p_after.should_not == p_before
    end
  end

  describe 'taking previous periods into account' do
    it "should return the correct period number" do
      3.times do |num| Period.create :name=>"Period_#{num}"; end
      Period.current.name.should == "Period_2"
    end
  end

  describe "handling postings with #period_end!" do
    fixtures :accounts

    before(:each) do
      @cashbook= Account.cashbook
      @account_one= Account.find 2
      @account_two= Account.find 2

      @account_one.transfer @account_two, 20.to_money
      @account_two.transfer @cashbook, 10.to_money

      @account_one_bal= @account_one.balance
      @account_two_bal= @account_two.balance
      @cashbook_bal= @cashbook.balance
    end

    it "should sum to 0" do
      sum_postings( Period.current.postings ).should == 0.to_money
      Period.period_end!
      sum_postings( Period.current.postings ).should == 0.to_money
    end

    it "should have only one posting" do
      Period.period_end!
      @account_one.postings.current.size.should == 1
      @account_two.postings.current.size.should == 1
    end

    it "should have same balances" do
      Period.period_end!
      @account_one.balance.should == @account_one_bal
      @account_two.balance.should == @account_two_bal
    end

    def sum_postings( postings)
      postings.inject(0.to_money) { |result, amount| result + amount }
    end
  end
end
