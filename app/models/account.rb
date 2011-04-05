class Account < ActiveRecord::Base
  has_many :journals
  
  def to_s
    "#{account_type}"
  end
end
