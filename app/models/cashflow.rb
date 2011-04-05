class Cashflow < ActiveRecord::Base
  belongs_to :assert_account
  belongs_to :expense
end
