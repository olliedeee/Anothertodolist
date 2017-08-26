class Todo < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :name, presence: true
  validates :description, presence: true

end