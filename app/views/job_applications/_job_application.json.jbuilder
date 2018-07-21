json.extract! job_application, :id, :candidate_id, :job_id, :created_at, :updated_at
json.url job_application_url(job_application, format: :json)
