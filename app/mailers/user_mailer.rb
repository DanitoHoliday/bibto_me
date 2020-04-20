class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
 def welcome(user)
  @user = user
    mail(
      :to => @user.email,
      :subject => 'Welcome to bibto.me | return lost items',
      :from => 'hello@bibto.me',
      :track_opens => 'true')
    # This will render a view in `app/views/user_mailer`!
  end

  def tag_found(tag, finder, full_message)
    @tag = tag
    @finder = finder
    @full_message = full_message
    mail(
      :to => @tag.user.email,
      :subject => 'Your item was found! | bibto.me',
      :from => 'hello@bibto.me',
      :track_opens => 'true')
    # This will render a view in `app/views/user_mailer`!
  end
end
