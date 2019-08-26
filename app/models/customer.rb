class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :client_addresses, dependent: :destroy
  has_many :orders
  has_many :cart_products
  has_many :favorites
  has_many :reviews

  enum gender:{男: 0, 女: 1, その他: 2}
end
