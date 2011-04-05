class Expense < ActiveRecord::Base
  has_many :cashflows
end
