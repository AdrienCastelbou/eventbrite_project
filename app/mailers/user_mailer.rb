class UserMailer < ApplicationMailer
  default from: 'no-reply@theeventbriteproject.fr'

  def welcome_email(user)
    @user = user
    @url = 'http://monsite.fr/login'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def confirmation_participation(participation)
    @participation = participation
    @url = 'http://monsite.fr/login'
    mail(to: @participation.user.email, subject: 'Confirmation d\'inscription à un evenement')
  end
end
