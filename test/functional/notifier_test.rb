require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "register_confirm" do
    mail = Notifier.register_confirm
    assert_equal "Register confirm", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
