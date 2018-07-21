class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update, :destroy, :save_response]
  before_action :authenticate_user!, only: [:index, :show]

  # GET /job_applications
  # GET /job_applications.json
  def index
    if current_user.admin?
      @job_applications = JobApplication.all
    else
      @job_applications = JobApplication.where(job: Job.where(user: current_user.company.users))
    end

  end

  # GET /job_applications/1
  # GET /job_applications/1.json
  def show
  end

  # GET /job_applications/new
  def new
    @job_application = JobApplication.new
  end

  # GET /job_applications/1/edit
  def edit
  end

  # POST /job_applications
  # POST /job_applications.json
  def create
    @job_application = JobApplication.new(job_application_params)

    respond_to do |format|
      if @job_application.save
        format.html { redirect_to @job_application, notice: 'Job application was successfully created.' }
        format.json { render :show, status: :created, location: @job_application }
      else
        format.html { render :new }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_applications/1
  # PATCH/PUT /job_applications/1.json
  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        format.html { redirect_to @job_application, notice: 'Job application was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applications/1
  # DELETE /job_applications/1.json
  def destroy
    @job_application.destroy
    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: 'Job application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_response
    @job_application = JobApplication.find_by_response_token(params[:response_token])
    @job_application.update_attributes(response_status: params[:response])
    respond_to do |format|
      if @job_application.accepted?
        format.html { redirect_to jobs_url, notice: 'You have accepted the interview invitation' }
      elsif @job_application.rejected?
        format.html {}
      end
    end
  end

  def save_response
    @job_application.update_attributes(rejection_reason: params[:job_application][:rejection_reason])
    redirect_to jobs_url, notice: 'Thanks for submitting the rejection reason!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_application_params
      params.require(:job_application).permit(:candidate_id, :job_id, :rejection_reason)
    end
end
