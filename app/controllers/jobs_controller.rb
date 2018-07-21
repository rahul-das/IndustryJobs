class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy, :approve, :new_application, :apply]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :approve]
  # GET /jobs
  # GET /jobs.json
  def index
    if user_signed_in?
      if current_user.admin?
        @jobs = Job.all
      else  # Organisation User
        @jobs = current_user.jobs
      end

    else # guest users
      @jobs = Job.where(approved: true)
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params.merge(user: current_user))

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params.merge(approved: false))
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    if current_user.admin?
      @job.update_attributes(approved: true)
    end
    redirect_back fallback_location: root_path
  end

  def new_application
    unless user_signed_in?
      respond_to do |format|
        format.html
      end
    end
  end

  def apply
    unless user_signed_in?
      logger.info "#{params.inspect}"
      @candidate = Candidate.find_or_create_by(name: params[:candidate][:name], email: params[:candidate][:email])
      if @candidate.present?
        @job.job_applications.create(candidate: @candidate)
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :user_id)
    end
end
