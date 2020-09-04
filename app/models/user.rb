class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy  #dependent~はUserのデータが削除されたときに削除される関係
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
