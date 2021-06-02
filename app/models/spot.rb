class Spot < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :s_name, presence: true
end
