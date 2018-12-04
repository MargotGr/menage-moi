class Task < ApplicationRecord
  belongs_to :coloc
  has_many :plannings
end
