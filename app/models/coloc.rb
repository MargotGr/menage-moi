class Coloc < ApplicationRecord
  has_many :tasks
  has_many :users
  validates :name, presence: true

  private

  def send_message_test_email
    ColocMailer.message_test.deliver_now
  end

  def send_creation_confirmation_email
    ColocMailer.creation_confirmation.deliver_now
  end

  def send_invitation_coloc_email
    ColocMailer.invitation_coloc.deliver_now
  end
end
