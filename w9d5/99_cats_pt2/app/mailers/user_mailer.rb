class UserMailer < ApplicationMailer
    default from: 'everybody@appacademy.io'

    def welcome_email(user)
        @url = 'http://appacademy.io/login'
        mail(to: user.email, subject: 'welcome email')
    end
end
