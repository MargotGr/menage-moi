require 'test_helper'

class ColocMailerTest < ActionMailer::TestCase
  test "creation_confirmation" do
    mail = ColocMailer.creation_confirmation
    assert_equal "Creation confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "invitation_coloc" do
    mail = ColocMailer.invitation_coloc
    assert_equal "Invitation coloc", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
