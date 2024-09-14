class User < ApplicationRecord
  has_one :cart
  has_many :cart_items, through: :cart
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    user_type == 'admin'
  end
end
