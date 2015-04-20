require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "confirmar_solicitud" do
    mail = UserMailer.confirmar_solicitud
    assert_equal "Confirmar solicitud", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
