class TrackMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.track_mailer.track_progress.subject
  #
  def track_progress(user, email)
    @user = user
    mail to: email, subject: "Track my progres"
  end
end
