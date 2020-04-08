class TestMailer < ActionMailer::Base

  def hello
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'hello@bibto.me',
      :from => 'hello@bibto.me',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end
end
