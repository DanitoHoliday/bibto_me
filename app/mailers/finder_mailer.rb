class FinderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.finder_mailer.notification.subject
  #
  def notification
    @user = params[:user] # Instance variable => available in view
    @finder = params[:finder]
    @tag = params[:tag]
    mail(to: @user.email, subject: 'bibto.me | Hurray!!! Your item was found')
    # This will render a view in `app/views/user_mailer`!
  end
end
