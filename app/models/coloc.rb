class Coloc < ApplicationRecord
  has_many :tasks
  has_many :users
  validates :name, presence: true
  def send_message_test_email
    ColocMailer.message_test.deliver_now
  end
end
