class Like < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates_uniqueness_of :spot_id, scope: :user_id

  scope :filter_by_spot, ->(spot_id) { where(spot_id: spot_id) if spot_id }
  
end


