class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :create_user_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :profile, dependent: :destroy

    has_many :followed_users, foreign_key: :follower_id, class_name: "Follow"
    has_many :followees, through: :followed_users
    has_many :following_users, foreign_key: :followee_id, class_name: "Follow"
    has_many :followers, through: :following_users

    private

    def create_user_profile
      self.create_profile
    end
end
