class Transaction < ApplicationRecord
  belongs_to :customer
  belongs_to :client
end
