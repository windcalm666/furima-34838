class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :birthday, presence: true

  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Include both letters and numbers'} do
    validates :password, presence: true
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
    validates :first_name, presence: true
    validates :last_name, presence: true
  end
  
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' } do
    validates :last_name_read, presence: true
    validates :first_name_read, presence: true
  end
end
