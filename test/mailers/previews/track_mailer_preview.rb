# Preview all emails at http://localhost:3000/rails/mailers/track_mailer
class TrackMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/track_mailer/track_progress
  def track_progress
    user = User.first
    user.track_digest = User.new_token
    email = "example2@tutorial.org"
    TrackMailer.track_progress(user, email)
  end

end
