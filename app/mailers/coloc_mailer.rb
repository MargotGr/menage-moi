class ColocMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.coloc_mailer.creation_confirmation.subject
  #
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
