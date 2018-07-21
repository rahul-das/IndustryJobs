class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def interview_invitation_email
    @job_application = params[:job_application]
    @url  = 'http://example.com/login'
    mail(to: @job_application.candidate.email, subject: 'Interview Invitation')
  end
end
