require File.join( File.expand_path(File.dirname(__FILE__)), 'spec_helper')


class IsCreditworthyTest < ActiveRecord::Base
  is_creditworthy
end


describe IsCreditworthyTest do

  it "should load all model definitions" do
    Period.new.should be_kind_of( Period)
    Account.new.should be_kind_of( Account)
    Journal.new.should be_kind_of( Journal)
    Posting.new.should be_kind_of( Posting)
  end

  describe 'concerned with accounts' do
    before(:all) do
      @ict = IsCreditworthyTest.create
    end

    it "should include #accounts" do
      @ict.should respond_to( :accounts)
    end

    it "should automatically include one account" do
      @ict.accounts.size.should_not == 0
    end

  end

  describe 'concerned with accounts #total_balance' do
    before(:all) do
      @ict = IsCreditworthyTest.create
    end

    it "should respond to it" do
      lambda { @ict.accounts.total_balance }.should_not raise_error
    end

    it "should calculate the total balance of all accounts" do
      ac1= @ict.accounts.first
      ac2= @ict.accounts.create!( :description => 'secondAccount')
      ac3= @ict.accounts.create!( :description => 'thirdAccount')
      cb= Account.cashbook
      cb.transfer ac1, 200.to_money
      cb.transfer ac2, 10.to_money
      cb.transfer ac3, 3.to_money
      @ict.accounts.total_balance.should == 213.to_money
    end

  end
end
