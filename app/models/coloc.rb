class Coloc < ApplicationRecord
  has_many :tasks
  has_many :users
  validates :name, presence: true, uniqueness: true
end
