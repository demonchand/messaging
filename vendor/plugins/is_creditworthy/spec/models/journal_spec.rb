require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')


describe Journal do
  fixtures :accounts

  it "should have 2 postings" do
    j = Journal.transfer @account_one, @account_two, 100.to_money
    j.postings.size.should == 2
  end

  it "should handle a Money object" do
    j = Journal.transfer @account_one, @account_two, 100.to_money
    j.postings.size.should == 2
  end

  it "'s postings should sum postings to 0" do
    j = Journal.transfer @account_one, @account_two, 100.to_money
    j.postings.sum(:cents).should == 0
  end
end
