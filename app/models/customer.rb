require 'carrierwave'

class Customer < ActiveRecord::Base  

  belongs_to :user

  has_many :folios

  has_many :savingsdeposits

  
  accepts_nested_attributes_for :folios
  
  #accepts_nested_attributes_for :savingsdeposits


  attr_accessible :addr, :city, :dob, :first_name, :last_name, :pan, :pincode, :sex, :state, :status, :code, :image, :folios_attributes
  
  mount_uploader :image, ImageUploader
  
  before_create :increment_code
  
  def increment_code
    self.code = (self.class.last.nil?) ? "0000000001" : ((self.class.last.code.to_i) + 1).to_s.rjust(10, '0')
  end 

  def self.search(search, id)
    if search
      where(["code LIKE ? OR first_name LIKE ?", "%#{search}%", "%#{search}%"])      
    else
      find(:all)
    end
  end

  before_save :set_default_val
    
  def set_default_val
    self.status = 'Pending' unless self.status
  end
  

  validates :first_name, presence: true, format: { with: %r{^[A-Z][a-zA-Z\s]*} }

  validates :last_name, presence: true, format: { with: %r{^[A-Z][a-zA-Z\s]*} } 

  validates_numericality_of :pincode, presence: true, length: { maximum: 6 }

  validates :pan, :uniqueness => true, presence:true, format: { with: %r{^[A-Z]{5}\d{4}[A-Z]{1}} }, length: {maximum: 10}

  validates_inclusion_of :dob,
      :in => Date.civil(1900, 1, 1)..Date.today,
      :message => "Must be between 1900 and now"

  validates :addr, presence: true

  validates :city, presence: true

  validates :state, presence: true

  validates :sex, presence: true
  
  validates :code, uniqueness: true  
   
end
