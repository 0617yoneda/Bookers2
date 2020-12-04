class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy#ユーザーとフォロー人結ぶ
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy#ユーザーとフォローされる人結ぶ
  has_many :following_user, through: :follower, source: :followed# 自分がフォローしている集団 配列で考える
  has_many :followed_user, through: :followed, source: :follower# 自分をフォローしている集団 配列で考える

  #フォロー
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  #フォロー解除
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  #フォローしてればtrue返し
  def following?(user)
  following_user.include?(user)
  end


  attachment :profile_image

  validates :name, length: { in: 2..20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
end
