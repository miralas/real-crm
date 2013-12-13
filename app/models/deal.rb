class Deal < ActiveRecord::Base
  belongs_to :account
  has_one :user, as: :owner
end
