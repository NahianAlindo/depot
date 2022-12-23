require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    puts "HIIIIIIIIIIIIIIIIIIIII#{mail}"
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /<td[^>]*>1<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    puts "HIIIIIIIIIIIIIIIIIII#{mail}"
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /<td[^>]*>1<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

end
