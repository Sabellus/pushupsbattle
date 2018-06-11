class User < ApplicationRecord
  has_secure_password
  has_many :trainings, dependent: :destroy
  has_and_belongs_to_many :follower, class_name: "User", foreign_key: "followed_id", join_table: "followers", association_foreign_key: "follower_id"
  has_and_belongs_to_many :followed, class_name: "User", foreign_key: "follower_id", join_table: "followers", association_foreign_key: "followed_id"

  validates :first_name,
            presence:true
  validates :last_name,
            presence:true
  validates :email,
            presence: true,
            uniqueness: true,
            format:{
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
  def to_s
    "#{first_name} #{last_name}"
  end
end
