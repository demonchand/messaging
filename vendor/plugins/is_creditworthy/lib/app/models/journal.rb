class Journal < ActiveRecord::Base
  has_many   :postings
  belongs_to :period

  validates_presence_of :period

  def self.transfer( source, destination, amount, description=nil)
    p = Period.current
    j = nil
    raise "no money given!!!" unless amount.is_a? Money

    transaction do
      j = create! :description => description, :period_id => p.id
      j.postings.create! :account=>source, :amount=>(Money.new(0) - amount), :period_id => p.id
      j.postings.create! :account=>destination, :amount=>amount, :period_id => p.id
      source.postings.reload
      destination.postings.reload
      source.check_after_transfer if source.methods.include? "check_after_transfer"
      destination.check_after_transfer if destination.methods.include? "check_after_transfer"
    end
    j
  end

  def self.current_period; 0; end
end
