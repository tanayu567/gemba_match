class Spot < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :s_name, presence: true

  def self.search(search)
    if search != ""
      Spot.where("s_name LIKE(?) or address LIKE(?) or start LIKE(?) or last LIKE(?) or money LIKE(?)", 
                  "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
    else  
      Spot.includes(:user)
    end
  end

end
