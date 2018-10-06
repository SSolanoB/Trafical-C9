require 'test_helper'

class TrackMailerTest < ActionMailer::TestCase
  test "track_progress" do
    mail = TrackMailer.track_progress
    assert_equal "Track progress", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
