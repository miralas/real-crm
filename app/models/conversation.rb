class Conversation < ActiveRecord::Base
  belongs_to :account
  has_many :messages
end
