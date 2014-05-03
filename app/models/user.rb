class User < ActiveRecord::Base

	ROLES = %w[Mgr Deo]

  has_many :customers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :Role
  
  # attr_accessible :title, :body 

  validates :Role, presence: true

end
