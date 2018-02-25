class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates :name, presence: true
  # validates :surnames, presence: true
  # validates :email, presence: true
  # validates :password, presence: true,
  #           length: { minimum: 5 }
end
