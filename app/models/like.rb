class Like < ApplicationRecord
  belongs_to :to_user, class_name: "User"
  belongs_to :from_user, class_name: "User"
end

enum status: { dislike: 0, like: 1 }
