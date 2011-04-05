require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Posting do
  fixtures :accounts
  before(:each) do
    @posting= Posting.new :amount => Money.new(100)
  end

  it 'should include a Money object' do
    @posting.amount.should be_a( Money)
  end

end
