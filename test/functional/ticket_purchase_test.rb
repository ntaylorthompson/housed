require 'test_helper'

class TicketPurchaseTest < ActionMailer::TestCase
  test "user_signup" do
    mail = TicketPurchase.user_signup
    assert_equal "User signup", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "show_reminder" do
    mail = TicketPurchase.show_reminder
    assert_equal "Show reminder", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "show_thank_you" do
    mail = TicketPurchase.show_thank_you
    assert_equal "Show thank you", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "host_thank_you" do
    mail = TicketPurchase.host_thank_you
    assert_equal "Host thank you", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
