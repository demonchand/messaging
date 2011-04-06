# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
user1 = User.create(:email => "abc@gmail.com", :password => "123456", :password_confirmation => "123456")
user2 = User.create(:email => "123@gmail.com", :password => "123456", :password_confirmation => "123456")

account_names = [ "assert account", "liability account", "owners capital account", "revenue account", "expense account", "withdrawal account" ]
account_names.each do |x|
  Account.create!(:account_type => x, :balance => 0, :date => Time.now)
end
