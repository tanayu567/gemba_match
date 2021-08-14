class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :spots, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :chat_room_users
  has_many :chat_rooms, through: :chat_room_users
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  default_scope -> { order(created_at: :desc) }
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end

  validates :name, presence: true
  validates :license, length: {maximum: 500}

  enum profession: { worker: 0, company: 1 }

  mount_uploader :profile_image, ProfileImageUploader

  def update_without_current_password(params, *options)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end
  
  def already_liked?(spot)
    self.likes.exists?(spot_id: spot.id)
  end
  
  def self.search(search)
    if search != ""
      User.where("name LIKE(?) or experience LIKE(?) or home LIKE(?) or license LIKE(?)", 
                  "%#{search}%","%#{search}%","%#{search}%","%#{search}%",)
    else  
      User.all

    end
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

end
