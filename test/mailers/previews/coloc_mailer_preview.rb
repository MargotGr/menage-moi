# Preview all emails at http://localhost:3000/rails/mailers/coloc_mailer
class ColocMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/coloc_mailer/creation_confirmation
  def creation_confirmation
    ColocMailer.creation_confirmation
  end

  # Preview this email at http://localhost:3000/rails/mailers/coloc_mailer/invitation_coloc
  def invitation_coloc
    ColocMailer.invitation_coloc
  end

end
