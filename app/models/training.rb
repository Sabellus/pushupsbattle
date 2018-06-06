class Training < ApplicationRecord
  belongs_to :user
  validates :count,
            presence: true
  validates :approaches,
            presence: true
  validates :comments,
            presence: false
  def to_s
    count
  end
end