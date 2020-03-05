# Preview all emails at http://localhost:3000/rails/mailers/finder_mailer
class FinderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/finder_mailer/notification
  def notification
    FinderMailer.notification
  end

end
