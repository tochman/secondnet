class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :store
  has_many :products, through: :store

  scope :store_owners, -> { where(store_owner: true) }
  scope :customers, -> {where(store_owner: false)}
end
