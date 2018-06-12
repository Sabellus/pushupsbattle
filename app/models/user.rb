class User < ApplicationRecord
  has_secure_password
  has_many :trainings, dependent: :destroy
  has_many :relationships, :foreign_key => "follower_id",
                       :dependent => :destroy
  has_many :active_relationships,  class_name:  "Relationship",
  foreign_key: "follower_id",
  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end


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
