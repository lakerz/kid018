class Notifier < ActionMailer::Base
  default :from => "service@kid018.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.register_confirm.subject
  #
  def register_confirm(register_user)
    @greeting = "Hi"

    @register_user = register_user

    mail :to => register_user.email, :subject => 'The confirmation email from kid018'
  end
end
