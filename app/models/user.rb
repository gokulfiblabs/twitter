class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :tweets
    # Followers refers to the user followings
    has_many :follower_relationship, :class_name => 'Follow', :foreign_key => 'following_id', dependent: :destroy 
    has_many :followers, :through => :follower_relationship, :source => 'follower'
    # Following refers to the user followers
    has_many :following_relationship, :class_name => 'Follow', :foreign_key => 'follower_id', dependent: :destroy 
    has_many :followings, :through => :following_relationship, :source => 'following'
end
