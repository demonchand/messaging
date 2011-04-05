class AssertAccount < ActiveRecord::Base
  validate :presence, :name
end
