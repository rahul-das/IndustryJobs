class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show]

  # GET /interviews
  # GET /interviews.json
  def index
    if current_user.admin?
      @interviews = Interview.all
    else
      job_applications = JobApplication.where(job: Job.where(user: current_user.company.users))
      @interviews = Interview.where(job_application: job_applications)
    end
    @interviews = Interview.all
  end

  # GET /interviews/1
  # GET /interviews/1.json
  def show
  end

  # GET /interviews/new
  def new
    @interview = Interview.new
  end

  # GET /interviews/1/edit
  def edit
  end

  # POST /interviews
  # POST /interviews.json
  def create
    @interview = Interview.new(interview_params)
    @interview.job_application.invitation_sent!

    # one mail will go to the applicant
    # In this mail, there should be two options. i) Accept, ii) Reject.
    UserMailer.with(job_application: @interview.job_application).interview_invitation_email.deliver

    respond_to do |format|
      if @interview.save
        format.html { redirect_to @interview, notice: 'Interview was successfully created.' }
        format.json { render :show, status: :created, location: @interview }
      else
        format.html { render :new }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interviews/1
  # PATCH/PUT /interviews/1.json
  def update
    respond_to do |format|
      if @interview.update(interview_params)
        format.html { redirect_to @interview, notice: 'Interview was successfully updated.' }
        format.json { render :show, status: :ok, location: @interview }
      else
        format.html { render :edit }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.json
  def destroy
    @interview.destroy
    respond_to do |format|
      format.html { redirect_to interviews_url, notice: 'Interview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_params
      params.require(:interview).permit(:date, :time, :job_application_id)
    end
end
