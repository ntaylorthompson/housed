class Mailer < ActionMailer::Base
  default from: "n.taylor.thompson@gmail.com"
  @greeting = "Hi"
  @user 
  @show
  @host
  @fan
  
  @guest
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_purchase.user_signup.subject
  #
  def user_signup(user)
    @user = user
    mail to: @user.email, subject: "Welcome to HOUSED!"
  end

  def ticket_purchase

    mail to: @guest.email, subject: "HOUSED - Ticket confirmation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_purchase.show_reminder.subject
  #
  def show_reminder

    mail to: @guest.email, subject: "Reminder: "+@user.name+" house show"
  end

  def user_show_reminder

    mail to: @user.email, subject: "Show reminder"
  end
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_purchase.show_thank_you.subject
  #
  def show_thank_you

    mail to: @guest.email, subject: "We hope you enjoyed the show"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_purchase.host_thank_you.subject
  #
  def host_thank_you

    mail to: @show.host_em, subject: "Thank you"
  end
end
