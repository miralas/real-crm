class Account < ActiveRecord::Base
  has_many :users
  has_many :deals
  has_many :companies
end
