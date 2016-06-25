class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :account
end
