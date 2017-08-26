class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  
  has_many :todos, dependent: :destroy
  has_many :comments, dependent: :destroy


  devise :database_authenticatable, :registerable,:confirmable,
  :recoverable, :rememberable, :trackable, :validatable
  
  
end
