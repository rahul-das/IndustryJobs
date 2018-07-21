class UserMailer < ApplicationMailer
  default from: 'notifications@fast-depths-56174.herokuapp.com'

  def interview_invitation_email
    @job_application = params[:job_application]
    @url  = 'http://fast-depths-56174.herokuapp.com'
    mail(to: @job_application.candidate.email, subject: 'Interview Invitation')
  end
end
