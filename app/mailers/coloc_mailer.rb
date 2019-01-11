class ColocMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.coloc_mailer.creation_confirmation.subject
  #
  def message_test(coloc, user)
    @coloc = coloc
    @user = user
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'contact@menage-moi.fr',
      :from => 'contact@menage-moi.fr',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end

  def creation_confirmation(coloc, user)
    @coloc = coloc
    @user = user
    mail(
      to:       @user.email,
      subject:  "Ta coloc #{@coloc.name} est créée!"
    )
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.coloc_mailer.invitation_coloc.subject
  #
  def invitation_coloc(coloc, user)
    @coloc = coloc
    @user = user
    mail to: @user.email
  end
end
