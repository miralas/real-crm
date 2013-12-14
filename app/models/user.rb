class User < ActiveRecord::Base
  belongs_to :role
  belongs_to :account
  has_many :deals
  has_many :companies
  has_many :tasks
  has_secure_password
  
  validates_associated :role
  
  def admin?
    role.title == 'admin'
  end
  
  def visiter?
    role.title == 'visiter'
  end
  
  def client?
    role.title == 'client'
  end
  
  def can?(controller, action)
    role.permit?(controller, action)
  end
 
end
