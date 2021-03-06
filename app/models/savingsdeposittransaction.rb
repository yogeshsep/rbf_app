class Savingsdeposittransaction < ActiveRecord::Base

  belongs_to :savingsdeposit 


  attr_accessor :current_balance

  attr_accessible :current_balance

  attr_accessible :comments, :particulars, :status, :transaction_amount, :transaction_date, :transaction_mode, :transaction_type, :savingsdeposit_id

  before_save :set_default_val
    
  def set_default_val
    self.status = 'Pending' unless self.status
  end

  before_save :set_default_date

  def set_default_date
    self.transaction_date = Date.today
  end  

       
  validates :transaction_type, presence: true

  validates :transaction_amount, presence: true

  validates :transaction_mode, presence: true

  validates :particulars, presence: true  

end
