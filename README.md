# README

* Ruby version: 2.5.1p57
* Rails version: 5.2.0

* ...

* There should be two type Users. i) Admin User, ii) Organisation User
* An organisation user can create multiple job vacancies for own organisation. 
* After creating job vacancies, Admin user will approve and then this vacancy will appear in the job list. 
* Job list is a news feed. Job Posts will appear there in newer-to-older order. 
* Candidate will visit this Job post and apply against a job with their Name and Email address. 
* One candidate could apply for a job once. 
* Organisation user could see applicants list and invite them for Interview. 
* When an Organisation user is inviting for an interview there will be an option to set the Date and Time of the interview.
* After that one mail will go to the applicant. 
* In this mail, there should be two options. i) Accept, ii) Reject. 
* If Applicant accepts this invitation then nothing to do, just show a message. If the applicant rejects this invitation then ask for a reason. Applicant actions will reflect in the applicant's list. 
* In applicants list, there will be Three type of filters.
  * Status wise (i.e. Invitation sent, Invitation Not Sent),
  * Response status wise (i.e. Accepted or Rejected),
  * Jobs title wise filter.
* Make sure multiple filters work at a time.

* ...

* Admin User cannot be registered from the frontend for security purpose.
* Created 1 admin user from the backend for your convenience.
  * Admin User Email: steven.hart@industryprime.com
  * Admin Password: password

* Company/Organization will be created by Admin only.
* Then Organization User can choose their company name while registration.
