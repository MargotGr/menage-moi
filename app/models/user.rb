class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :plannings
  has_many :tasks, through: :plannings
  has_many :tasks, through: :colocs
  belongs_to :coloc
end
