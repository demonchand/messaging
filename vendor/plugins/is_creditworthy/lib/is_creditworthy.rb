# IsCreditworthy

require 'money'

%w{ models }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'app', dir)
  $LOAD_PATH << path
  ActiveSupport::Dependencies.load_paths << path
  ActiveSupport::Dependencies.load_once_paths.delete(path)
end

module ActiveRecord
module IsCreditworthy

  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def is_creditworthy
      has_many :accounts, :as => :owner do
        def total_balance
          inject(0.to_money) do |sum, acc|
            sum + acc.balance
          end
        end
      end

      after_create :ensure_one_account

      send :include, InstanceMethods
    end

  end

  module InstanceMethods
    def ensure_one_account
      if accounts.count == 0
        accounts.create!( :description => 'InitialAccount')
      end
    end
  end

end; end

ActiveRecord::Base.send :include, ActiveRecord::IsCreditworthy
