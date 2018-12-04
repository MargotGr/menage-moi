class Coloc < ApplicationRecord
  has_many :tasks
  has_many :users
  has_many :plannings, through: :tasks
  has_many :plannings, through: :users
end
