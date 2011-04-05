class Account < ActiveRecord::Base

  def to_s
    "#{account_type}"
  end
end
