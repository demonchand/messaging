class AssertAccount < ActiveRecord::Base

  has_many :cashflows
  validate :presence, :name
end
