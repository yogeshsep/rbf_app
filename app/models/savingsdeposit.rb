class Savingsdeposit < ActiveRecord::Base    

	belongs_to :customer

    attr_accessor :transaction_amount

    attr_accessible :transaction_amount

    has_many :savingsdeposittransactions

    accepts_nested_attributes_for :savingsdeposittransactions, :allow_destroy => true
  
    attr_accessible :account_type, :current_balance, :opened_on, :status, :customer_id, :savingsdeposittransactions_attributes

    before_save :set_default_val
    
    def set_default_val
      self.status = 'Pending' unless self.status
    end
    
    before_save :set_opened_on
    
    def set_opened_on
      self.opened_on = Date.today
    end   

    validates :account_type, presence: true    

    validates :current_balance, numericality: { greater_than: 100, presence: true }
        
end
